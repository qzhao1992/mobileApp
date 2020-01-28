import 'package:flutter/material.dart';

import '../view/registrationpage.dart';
import '../model/user.dart';

class RegistrationPageController{

  RegistrationPageState state;
  User user = User();
  RegistrationPageController(this.state);

  void saveEmail(String value){
    user.email = value;
  }

  void savePassword(String value){
    user.password = value;
  }

  void saveAge(String value){
    user.age = int.parse(value);
  }

  String validateEmail(String value){
    if(value.contains('@') && value.contains('.')){
      return null;
    }else{
      return 'not valid email format (@ and . should be include)';
    }
  }

  String validatePassword(String value){
    if(value.length < 4){
      return 'too short (main 4 chars)';
    }else{
      return null;
    }
  }

  String validateAge(String value){
    try{
      int age = int.parse(value);
      if(age < 0){
        throw Exception('not positive');
      }
      return null;
    } catch(e){
      return 'Not a integer';
    }
  }

  List<DropdownMenuItem>showDropdownMenus(){
    return CLASSIFICATION.map((item){
      return DropdownMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList();
  }

  void onChangedClassification(String value){
    user.classification = value;
    state.stateChanged((){
      user.classification = value;
    });
  }

  String validateClassification(String value){
    if(value == null || value.isEmpty){
      return 'Select a classification';
    }
    return null;
  }

  void saveClassification(String value){
    user.classification = value;
  }

  void register(){
    if(state.formKey.currentState.validate()){
      state.formKey.currentState.save();
      print(user.email + ' ' + user.password + ' ' + user.age.toString());
      print('Dart: ' + user.languages['dart'].toString());
      print('Java: ' + user.languages['java'].toString());
    }
  }

  void onChangedDart(bool value){
    state.stateChanged((){
      user.languages['dart'] = value;
    });
    
  }

  void onChangedJava(bool value){
    state.stateChanged((){
      user.languages['java'] = value;
    });
  }
}