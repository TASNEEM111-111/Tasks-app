import 'package:firstapp/modules/counter/cubit/cubit.dart';
import 'package:firstapp/modules/counter/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>counterCubit(),
      child: BlocConsumer<counterCubit,counterStates>(
        listener: (context,state) {
          if(state is counterIntialState);// print('intial state');
          if(state is counterMinusState) ;//print('minus state ${state.counter}');
          if(state is counterPlusState) ;//print('plus state ${state.counter}');
        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'COUNTER',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Expanded(
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                       counterCubit.get(context).minus();
                      },
                      child: Text(
                        'MINUS',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Text(
                        '${counterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                       counterCubit.get(context).plus();
                      },
                      child: Text(
                        'PLUS',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

