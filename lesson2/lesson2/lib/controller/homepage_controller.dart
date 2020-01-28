import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/view/homepage.dart';
import '../view/homepage.dart';
import '../view/registrationpage.dart';

const POPUPMENULIST = [
  'Registration',
  'Profile',
  'Search'
];

class HomePageController{

  HomePageState state;
  HomePageController(this.state);

  void upButton(){
    
    state.stateChanged((){
      ++state.count;
    });
  }

  void downButton(){
    state.stateChanged((){
      --state.count;
    });
  }

  List<PopupMenuEntry<String>> showPopupMenu(BuildContext context){
    return POPUPMENULIST.map((item){
      return PopupMenuItem(
        value: item,
        child: Text(item),
        );
    }).toList();
  }

  void popupMenuSelected(String menu){
    var destination;
    if(menu == POPUPMENULIST[0]){
      destination = RegistrationPage();
    }

    if(destination != null){
      Navigator.push(state.context, MaterialPageRoute(
        builder:(BuildContext context){return destination;},
      ));
    }

  }
}