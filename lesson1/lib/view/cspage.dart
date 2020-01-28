import 'package:flutter/material.dart';

class CSPage extends StatelessWidget{

  var data;
  String description = 'fdsfsdfsdfsfsdfsdfdsfsdfsdfsfsdfsdfdsfsdfsdfsfsdfsd';
  CSPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CS Home'),
      ),
      body: ListView(
        children: <Widget>[
          Text('Enrollment: undergrads = ${data['ug']} , grads = ${(data['gr'])}',
          style:TextStyle(fontSize:20)
          ),
          Image.asset('assets/images/cs.jpg'),
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Department of Computer Science'),
                    Text('Edmond Oklahoma'),
                  ],
                ),
              ),
            ),
            Container(child: Icon(Icons.star)),
            Container(child: Text('3100'))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon:Icon(Icons.directions), onPressed: (){},),
              IconButton(icon:Icon(Icons.call), onPressed: (){},),
              IconButton(icon:Icon(Icons.web), onPressed: (){},)
            ],
          ),
          Card(
            elevation: 10,
            color: Colors.teal,
            child: Text(description),
          ),
        ],
      ),
    );
  }

}