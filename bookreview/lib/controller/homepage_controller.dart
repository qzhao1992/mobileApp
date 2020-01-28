import 'package:flutter/material.dart';
import '../view/homepage.dart';
import '../view/bookpage.dart';
import '../controller/myfirebase.dart';
import '../model/book.dart';
import '../view/sharedBookspage.dart';

class HomePageController{
  HomePageState state;

  HomePageController(this.state);

  void signOut(){
    MyFirebase.signOut();
    Navigator.pop(state.context); // to close the drawer at home page
    Navigator.pop(state.context); // to return to the front page
  }

  void addButton() async{
    Book b = await Navigator.push(state.context, MaterialPageRoute(
      builder: (context) => BookPage(state.user, null),
    ));

    if(b != null){
      state.booklist.add(b);
    }else{
      // error occurred in storing in Firebase
    }
  }

  void onTap(int index) async{
    if(state.deleteIndices == null){
      //navigate to Bookpage
      Book b = await Navigator.push(state.context, MaterialPageRoute(
        builder: (context) => BookPage(state.user, state.booklist[index]),
      ));

      if(b != null){
        //updated book is stored in Firebase
        state.booklist[index] = b;
      }
    }
    else{
      //add to delete list
      if(state.deleteIndices.contains(index)){
        //tapped again -> deselect
        state.deleteIndices.remove(index);
        if(state.deleteIndices.length ==0){
          // all deselected. delete mode quits
          state.deleteIndices = null;
        }
        
      } else{
        state.deleteIndices.add(index);
      }

      state.stateChanged((){

      });

    }
    
  }

  void longPress(int index){
    if(state.deleteIndices == null){
      //begian delete mode
      state.stateChanged((){
        state.deleteIndices = <int>[index];
      });
    }
  }

  void deleteButton() async{

    // sort decscending order of deleteIndices
    state.deleteIndices.sort((n1, n2){
      if(n1 < n2) return 1;
      else if(n1 == n2) return 0;
      else return -1;
    });
    //deleteIndices: [a, b, c, d]
      for (var index in state.deleteIndices){
        try{
          await MyFirebase.deleteBook(state.booklist[index]);
          state.booklist.removeAt(index);
        } catch (e){
          print('BOOK DELETE ERROR: ' + e.toString());
        }
        
      }
      state.stateChanged((){
        state.deleteIndices = null;
      });

  }

  void sharedWithMeMenu() async{
    List<Book> books = await MyFirebase.getBooksSharedWithMe(state.user.email);
    print(books.length.toString());
    for(var book in books){
      print(book.title);
    }
    //navigate to a new page for SharedBooks
    await Navigator.push(state.context, MaterialPageRoute(
      builder: (context) => SharedBooksPage(state.user, books),
    ));
    Navigator.pop(state.context); // cloase the drawe
  }
}