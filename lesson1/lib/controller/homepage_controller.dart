import 'package:flutter/material.dart';

import '../view/homepage.dart';
import '../view/cspage.dart';

class HomePageController{
  
  HomePage homePage;

  HomePageController(this.homePage);

  void flatButtonPressed(){
    print('Flat button pressed');
  }

  void iconButtonPressed(){
    // print('icon button pressed');
    showDialog(
      context:homePage.context,
      builder: (context){
        return AlertDialog(
          title: Text('IconButton'),
          content: Text('Icon Button is pressed'),
          actions:<Widget>[
            RaisedButton(
              child: Text('OK', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(homePage.context);
              },
            )
          ]
        );
      }
    );
  }

  void raisedButtonPressed(){
    print('raised button pressed');
  }

  void csButton() async{
    var data = <String, int>{'ug': 450, 'gr': 31};
    await Navigator.push(homePage.context, MaterialPageRoute(
      builder: (BuildContext context){return CSPage(data);},
    ));
    Navigator.pop(homePage.context);
  }
}