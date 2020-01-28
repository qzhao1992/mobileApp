import 'package:flutter/material.dart';
import '../controller/homepage_controller.dart';

class HomePage extends StatelessWidget{

  HomePageController controller;
  BuildContext context;

  HomePage(){
    controller = HomePageController(this);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson1 Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Choose a menu:'),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text('Qing'),
              accountEmail: Text('qzhao@uco.edu'),
              currentAccountPicture: Image.asset('assets/images/cs.jpg'),
            ),
            RaisedButton(
              child: Text('cs Department'),
              onPressed: controller.csButton,
            ),
            RaisedButton(
              child: Text('UCO'),
              onPressed: (){},
            ),
          ],),),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text('One', style: TextStyle(fontSize: 100),)),
              Expanded(child: Text('One', style: TextStyle(fontSize: 100),)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/cs.jpg')),
              Expanded(child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRebL2bz6JI00Z-YsdWQrMoH0fK44HwNjNYbUGFxAvATk8sU-XX')),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('flat button'),
                onPressed: controller.flatButtonPressed,
              ),IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: controller.iconButtonPressed,

          ),
          RaisedButton(
            child: Text('Raised Button'),
            onPressed: controller.raisedButtonPressed,
          ),
            ],
          ),
          
          Text('One', style: TextStyle(fontSize: 100),),
          Text('One', style: TextStyle(fontSize: 100),),
          Text('One', style: TextStyle(fontSize: 100),),
          Text('One', style: TextStyle(fontSize: 100),),
          Text('One', style: TextStyle(fontSize: 100),),
          
          Text('Two'),
          Text('Three'),
        ],
      ),
    );
  }

}