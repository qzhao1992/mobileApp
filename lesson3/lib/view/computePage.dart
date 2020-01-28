import 'package:flutter/material.dart';
import 'package:lesson3/modal/ComputeObject.dart';
import '../modal/ComputeObject.dart';
import '../controller/computepage_controller.dart';

class ComputePage extends StatefulWidget{

  final ComputeObject computeObject;

  ComputePage(this.computeObject);

  @override
  State<StatefulWidget> createState() {
    return ComputePageState(computeObject);
  }
  
}

class ComputePageState extends State<ComputePage>{
  ComputeObject computeObject;
  ComputePageController controller;
  BuildContext context;
  var computationResults = <String, dynamic>{};

  ComputePageState(this.computeObject){
    controller = ComputePageController(this);
  }

  void stateCHanged(Function fn){
    setState(fn);
  } 

  @override
  Widget build(BuildContext context) {

    this.context = context;

    return WillPopScope(
      onWillPop: (){},
      child: Scaffold(
        appBar: AppBar(
          title: Text('Compute Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: controller.backbutton,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.computer),
              onPressed: controller.compute,
            )
          ],
        ),
        body:Column(
          children: <Widget>[
            Text('Requested Information:', 
              style: TextStyle(fontSize: 20),
            ),
            Text('n1 = ${computeObject.num1}\n' +
              'n2 = ${computeObject.num2}\n' +
              'optype = ${computeObject.optype}\n' +
              'inputScale = ${computeObject.inputScale}\n',
              style: TextStyle(fontSize: 20),
            ), 
            computationResults['exec'] == null ? Text('') :
            Text('Execution time: ${computationResults['exec']}',
              style: TextStyle(fontSize: 20),),
            computationResults['message'] == null ? Text('') :
            Text('computation Results:\n ${computationResults['message']}',
              style: TextStyle(fontSize: 20),),
          ],
        )
      ),
    );
  }

}