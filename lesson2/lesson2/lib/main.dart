import 'package:flutter/material.dart';
import './view/homepage.dart';

void main(){
  runApp(Lesson2App());
}

class Lesson2App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:'Lesson2App',
      home: HomePage(),
    );
  }

}