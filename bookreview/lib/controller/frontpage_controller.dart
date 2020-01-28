import 'package:bookreview/controller/myfirebase.dart';
import 'package:bookreview/model/book.dart';
import 'package:bookreview/view/mydialog.dart';
import '../view/mydialog.dart' as prefix0;
import 'package:flutter/material.dart';
import '../view/frontpage.dart';
import '../view/signuppage.dart';
import '../view/homepage.dart';
import '../model/user.dart';

class FrontPageController {
  FrontPageState state;

  FrontPageController(this.state);

  void createAccount(){
     Navigator.push(state.context, MaterialPageRoute(
       builder: (context) => SignUpPage(),
     ));
  }

  String validateEmail(String value){
    if(value == null || !value.contains('.') || !value.contains('@')){
      return 'Enter value Email address';
    }
    return null;
  }

  void saveEmail(String value){
    state.user.email = value;
  }

  String validatePassword(String value){
    if(value == null || value.length < 6){
      return 'Enter password';
    }
    return null;
  }

  void savePassword(String value){
    state.user.password = value;
  }

  void login() async{
    if(!state.formKey.currentState.validate()){
      return;
    }
    state.formKey.currentState.save();

    MyDialog.showProgressBar(state.context);

    try{
      state.user.uid = await MyFirebase.login(
        email: state.user.email, 
        password: state.user.password,
      );

      
    } catch(e){
      MyDialog.popProgressBar(state.context);
      MyDialog.info(
        context: state.context,
        title: 'Login Error',
        message: e.message != null ? e.message : e.toString(),
        action: () => Navigator.pop(state.context),
      );
      return;
    }

    //login success -> read user profile
    try{
      User user = await MyFirebase.readProfile(state.user.uid);
      state.user.displayName = user.displayName;
      state.user.zip = user.zip;
    }catch(e){
      //no displayname and zip can be update
    }

    //read book reviews this user has created
    List<Book> booklist; 
    try{
      booklist = await MyFirebase.getBooks(state.user.email);
    }catch(e){
      booklist = <Book>[];
    }
    
    
    MyDialog.popProgressBar(state.context);
    MyDialog.info(
        context: state.context,
        title: 'Login Success',
        message: 'Press <OK> Navigate to User Home Page',
        action: () {
          Navigator.pop(state.context);
          Navigator.push(state.context, MaterialPageRoute(
            builder: (context) => HomePage(state.user, booklist),
          ));
        }
         
        ,
      );
  }
}