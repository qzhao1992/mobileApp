import 'package:flutter/material.dart';
import '../controller/homepage_controller.dart';
import '../modal/ComputeObject.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  HomePageController controller;
  BuildContext context;
  var formKey = GlobalKey<FormState>();
  var computationResults = <String, dynamic>{}; 

  HomePageState(){
    controller = HomePageController(this);
  }

  void stateChanged(Function fn){
    setState(fn);
  }



  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson3'),
      ),
      body: Column(
        children: <Widget>[
          Text('Enter numbers', style: TextStyle(fontSize: 20)),
          Form(
            key: formKey,
            child: Expanded(
              child: ListView(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter a number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: controller.validateNum,
                  onSaved: controller.saveNum1,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter a number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: controller.validateNum,
                  onSaved: controller.saveNum2,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Text('Choose an operation type',
                      style: TextStyle(fontSize: 20),
                      ),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: RadioListTile<String>(
                      title:Text(ComputeObject.OP_ADD),
                      value: ComputeObject.OP_ADD,
                      groupValue: controller.computeObject.optype, 
                      onChanged: controller.radioOptypeChanged,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title:Text(ComputeObject.OP_MUL),
                      value: ComputeObject.OP_MUL,
                      groupValue: controller.computeObject.optype, 
                      onChanged: controller.radioOptypeChanged,
                    ),
                  ),
                ],),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Text('Choose an scale factor',
                      style: TextStyle(fontSize: 20),
                      ),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: RadioListTile<int>(
                      title:Text('${ComputeObject.x1}X'),
                      value: ComputeObject.x1,
                      groupValue: controller.computeObject.inputScale, 
                      onChanged: controller.radioInputScaleChanged,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<int>(
                      title:Text('${ComputeObject.x10}X'),
                      value: ComputeObject.x10,
                      groupValue: controller.computeObject.inputScale, 
                      onChanged: controller.radioInputScaleChanged,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<int>(
                      title:Text('${ComputeObject.x100}X'),
                      value: ComputeObject.x100,
                      groupValue: controller.computeObject.inputScale, 
                      onChanged: controller.radioInputScaleChanged,
                    ),
                  ),
                  
                ],),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: controller.onSubmit,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(''),
                ),
                computationResults['exec'] == null ? Text(''):
                  Text('Excution time: ${computationResults['exec']}',
                    style: TextStyle(fontSize: 15),
                  ),
                computationResults['message'] == null ? Text(''):
                  Text('Excution Results: ${computationResults['message']}',
                    style: TextStyle(fontSize: 15),
                  ),
              ],),
            ),
          )
        ],
      )
    );
  }

}