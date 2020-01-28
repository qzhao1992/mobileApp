import 'package:bookreview/controller/myfirebase.dart';
import '../view/mydialog.dart';
import 'package:flutter/material.dart';
import '../view/bookpage.dart';

class BookPageController{

  BookPageState state;
  BookPageController(this.state);

  String validateImageUrl(String value) {
    if(value == null || value.length < 5){
      return 'Enter Image URL beginning with http';
    }
    return null;
  }

  void saveImageUrl(String value) {
    state.bookCopy.imageUrl = value;
  }

  String validateTitle(String value) {
    if(value == null || value.length < 5){
      return 'Enter book title';
    }
    return null;
  }

  void saveTitle(String value) {
    state.bookCopy.title = value;
  }

  String validateAuthor(String value) {
    if(value == null || value.length < 3){
      return 'Enter book author';
    }
    return null;
  }

  void saveAuthor(String value) {
    state.bookCopy.author = value;
  }

  String validatePubyear(String value) {
    if(value == null){
      return 'Enter publication year';
    }
    try{
      int.parse(value);
    } catch(e){
      return 'Enter publication year in numbers';
    }
    return null;
  }

  void savePubyear(String value) {
    state.bookCopy.pubyear = int.parse(value);
  }

  String validateSharedWith(String value) {
    if(value == null || value.trim().isEmpty){
      return null;
    }
    
    for(var email in value.split(',')){
      if(!(email.contains('.') && email.contains('@'))){
        return 'Enter comma(,) separated email list';
      }
      if(email.indexOf('@') != email.lastIndexOf('@')){
        return 'Enter comma(,) separated email list';
      }
    }
    return null;
  }

  void saveSharedWith(String value) {
    if(value == null || value.trim().isEmpty){
      return;
    }
    state.bookCopy.sharedWith = [];
    List<String> emaillist = value.split(',');
    for (var email in emaillist){
      state.bookCopy.sharedWith.add(email.trim());
    }
  }

  String validateReview(String value){
    if(value == null || value.length < 5){
      return 'Enter book review (min 5 chars)';
    }
    return null;
  }

  void saveReview(String value){
    state.bookCopy.review = value;
  }

  void save() async{
    if(!state.formKey.currentState.validate()){
      return;
    }
    state.formKey.currentState.save();

    // print('*******share with: ' + state.bookCopy.sharedWith.toString());
    
    state.bookCopy.createdBy = state.user.email;
    state.bookCopy.lastUpdatedAt = DateTime.now();

    try{
      if(state.book == null){
        state.bookCopy.documentId = await MyFirebase.addBook(state.bookCopy);
      }else{
        // from homepage to edit
        await MyFirebase.updateBook(state.bookCopy);
      }
      
      Navigator.pop(state.context, state.bookCopy);
    } catch (e){
      MyDialog.info(
        context: state.context,
        title: 'Firebase Save Error',
        message: 'Firebase is unavailable now. Try again later',
        action: (){
          Navigator.pop(state.context);
          Navigator.pop(state.context, null);
        },
      );
    }
    
  }
}