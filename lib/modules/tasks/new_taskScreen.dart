import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstapp/shared/componants/componants.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componants/constants.dart';
import '../../shared/cubit/states.dart';

class newTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  return Container();
   return BlocConsumer<AppCubit, AppStates>(
     listener: (context,state){},
      builder: (context,state){
        var tasks=AppCubit.get(context).newtasks;
       return taskBuilder(
         tasks: tasks,
       );
      },
    );
  }

  }