import 'package:bloc/bloc.dart';
import 'package:firstapp/modules/counter/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterCubit extends Cubit<counterStates>
{
 int counter =1;
 counterCubit(): super(counterIntialState());
 static counterCubit get(context) => BlocProvider.of(context);

 void minus(){
  counter--;
   emit(counterMinusState(counter));
}
void plus(){
  counter++;
  emit(counterPlusState(counter));
}
}