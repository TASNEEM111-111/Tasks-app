import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../shared/componants/componants.dart';

class login_screen extends StatefulWidget {
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formKey =GlobalKey<FormState>();

  bool ispassword =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultformfield(
                    controller: emailcontroller,
                      keyboardtype: TextInputType.emailAddress,
                      validate: (value){
                    if(value!.isEmpty){
                      return 'email mustn\'t be empty';
                    }
                    return null;
                      },
                      label: 'Email',
                      pre_icon:Icons.email,
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultformfield(controller: passwordcontroller,
                      keyboardtype: TextInputType.visiblePassword,
                      validate:(value){
                      if(value!.isEmpty) {
                        return 'the password musn\'t be empty' ;
                      }return null;
                      },
                       label:'password',
                      pre_icon:Icons.lock,
                      suf_Icon: ispassword?Icons.visibility:Icons.visibility_off,

                      isPassword: ispassword,
                    suffixPressed: (){
                    setState(() {
                      ispassword=!ispassword;
                    });
                    },


                  ),
                  SizedBox(
                    height: 20,
                  ),
              DefaultButton(
               text: 'login',
               function: (){
                   if(formKey.currentState!.validate()){
                     print(emailcontroller.text);
                     print(passwordcontroller.text);
                   }
                 },
                  height: 50,
                radious: 15,

              ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Donr't have an account",
                      ),
                      TextButton(onPressed: () {}, child: Text("Create one"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
