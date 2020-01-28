import 'package:flutter/material.dart';
import '../controller/registrationpage_controller.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegistrationPageState();
  }

}

class RegistrationPageState extends State<RegistrationPage>{

  RegistrationPageController controller;
  BuildContext context;
  var formKey = GlobalKey<FormState>();

  RegistrationPageState(){
    controller = RegistrationPageController(this);
  }

  void stateChanged(Function fn){
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:20),
            child: Text('registration page', style: TextStyle(fontSize: 20))
            ),
        Form(
          key: formKey,
          child: Expanded(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: controller.validateEmail,
                  onSaved: controller.saveEmail,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.security),
                    hintText: 'password',
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  autocorrect: false,
                  validator: controller.validatePassword,
                  onSaved: controller.savePassword,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'age'
                    ),
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    validator: controller.validateAge,
                    onSaved: controller.saveAge,
                ),
                DropdownButtonFormField<String>(
                  hint: Text('classification'),
                  value: controller.user.classification,
                  items: controller.showDropdownMenus(),
                  onChanged: controller.onChangedClassification,
                  validator: controller.validateClassification,
                  onSaved: controller.saveClassification
                ),
                Container(padding: EdgeInsets.only(top:20), child: Text('Language Proficiency', style: TextStyle(fontSize: 20),)),
                Wrap(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text('Dart'),
                      Checkbox(
                      value: controller.user.languages['dart'] ?? false,
                      onChanged: controller.onChangedDart,
                      )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Java'),
                        Checkbox(
                        value: controller.user.languages['java'] ?? false,
                        onChanged: controller.onChangedJava,
                        )
                      ],
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text('Register'),
                  onPressed: controller.register,
                  )
              ],
            ),
          ),)
        ],
        )
      );
  }

}