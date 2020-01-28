import 'package:flutter/material.dart';
import './view/homepage.dart';

void main(){
  runApp(Lesson1App());
}

class Lesson1App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Lesson1',
      home: HomePage(),
    );
  }

}