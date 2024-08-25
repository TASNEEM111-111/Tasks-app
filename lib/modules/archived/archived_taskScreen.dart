import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componants/componants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class archivedTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var tasks =AppCubit.get(context).archivedtasks;
        return taskBuilder(
          tasks: tasks ,
        );
      },
    );
  }
}
