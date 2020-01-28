import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson3/modal/ComputeObject.dart';
import 'package:lesson3/view/computePage.dart';

class ComputePageController{
  ComputePageState state;

  ComputePageController(this.state);

  void compute(){
    double results;
    double n1 = state.computeObject.num1 * state.computeObject.inputScale;
    double n2 = state.computeObject.num2 * state.computeObject.inputScale;

    String op;
    if(state.computeObject.optype == ComputeObject.OP_ADD){
      op = '+';
      results = n1 + n2;
    }else if(state.computeObject.optype == ComputeObject.OP_MUL){
      op = 'X';
      results = n1 * n2; 
    }

    

    state.stateCHanged((){
      state.computationResults['exec'] = Random().nextDouble();
      state.computationResults['message'] = 'Results: $n1 $op $n2 = $results';
    });

    
  }

  void backbutton(){
      Navigator.pop(state.context, state.computationResults);
    }
}