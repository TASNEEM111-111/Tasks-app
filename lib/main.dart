import 'package:bloc/bloc.dart';
import 'package:firstapp/layout/home_layout.dart';
import 'package:firstapp/modules/home/home_screen.dart';
import 'package:firstapp/modules/login/login_screen.dart';
import 'package:firstapp/modules/massengerscreen/massengerFile.dart';
import 'package:firstapp/modules/tasks/new_taskScreen.dart';
import'package:firstapp/modules/users/users_screen.dart';
import 'package:firstapp/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

import 'delete_me.dart';
import 'modules/bmi/Bmi_caculator.dart';
import 'package:firstapp/modules/bmires/bmi_resultScreen.dart';
import 'package:firstapp/modules/counter/counter_screen.dart';

void main() {
 Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeLayout(),
    );
  }
}
