
import 'package:flutter/material.dart';
import '../view/homepage.dart';
import '../modal/ComputeObject.dart';
import '../view/computePage.dart';

class HomePageController{
 
  HomePageState state;
  ComputeObject computeObject = ComputeObject(0, 0, ComputeObject.OP_ADD, ComputeObject.x1);

  HomePageController(this.state);

  String validateNum(String value){
    if(value == null || value.isEmpty){
      return 'Enter a valid number';
    }
    try {
      double.parse(value);
    }catch(e){
      return 'Enter a valid a number';
    }
    return null;
  }

  void saveNum1(String value){
    computeObject.num1 = double.parse(value);
  }

  void saveNum2(String value){
    computeObject.num2 = double.parse(value);
  }

  void radioOptypeChanged(String value){
    state.stateChanged((){
      computeObject.optype = value;
    });
  }

  void radioInputScaleChanged(int value){
    state.stateChanged((){
      computeObject.inputScale = value;
    });
  }

  void onSubmit() async{
    if(state.formKey.currentState.validate()){
      state.formKey.currentState.save();
      state.computationResults = await Navigator.push(state.context, MaterialPageRoute(
        builder: (BuildContext context){ return ComputePage(computeObject);}
      ));
    }
  }
}