import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

//import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived/archived_taskScreen.dart';
import 'package:firstapp/modules/doneTasks/done_taskScreen.dart';
import 'package:firstapp/modules/tasks/new_taskScreen.dart';
import 'package:firstapp/shared/componants/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/componants/constants.dart';
import '../shared/cubit/states.dart';
//create database
//create tables
//open database
//insert to database
//get from database
//update database
//delete database
class HomeLayout extends StatelessWidget {

  Future<String> getName() async
  {
    return 'Ahmed Ali';
  }

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            floatingActionButton: FloatingActionButton(
              /*onPressed: ()async
            {
              try{
               // throw('errorss');
                var name =await getName() ;
                print(name);
              }
              catch(error){
                print('error ${error.toString()}');
            }

            },*/
              onPressed: () {
                /* getName().then((value) {
                print(value);
                print('osama');
                throw("ooffffff");
              }).catchError((error) {
                print('error: ${error.toString()}');
              }
              );*/
                // insertDatabase();
                if (cubit.isBottomSheet) {
                  if (formkey.currentState!.validate()) {
                   // Navigator.pop(context);
                    cubit.insertDatabase(title: titlecontroller.text, date: datecontroller.text,
                        time: timecontroller.text).then((value)
                    {
                      cubit.changeBottomSheetState(false, Icons.add);
                    });
                    /*insertDatabase(
                      title: titlecontroller.text,
                      date: datecontroller.text,
                      time: timecontroller.text,
                    ).then((value) {
                      getFromDatabase(cubit.database).then((value) {
                        /*  setState(() {
                        tasks = value;
                        isBottomSheet = false;
                        fabicon = Icons.edit;
                        print(tasks);
                      });*/
                      });
                    });*/
                  }
                }
                else {
                  scaffoldkey.currentState?.showBottomSheet
                    ((context) =>
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultformfield(
                                controller: titlecontroller,
                                keyboardtype: TextInputType.text,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task title',
                                pre_icon: Icons.title,
                              ),
                              SizedBox(height: 15,),
                              defaultformfield(
                                  controller: timecontroller,
                                  keyboardtype: TextInputType.datetime,
                                  validate: (value) {
                                    if (value !.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task time ',
                                  pre_icon: Icons.watch_later_outlined,
                                  onTap: () {
                                    showTimePicker(context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timecontroller.text =
                                          value!.format(context);
                                      print(value.format(context));
                                    });
                                  }
                              ),
                              SizedBox(height: 15,),
                              defaultformfield(
                                  controller: datecontroller,
                                  keyboardtype: TextInputType.datetime,
                                  validate: (value) {
                                    if (value !.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task date ',
                                  pre_icon: Icons.calendar_today,
                                  onTap: () {
                                    showDatePicker(context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-03-25'),
                                    ).then((value) {
                                      datecontroller.text =
                                          DateFormat.yMMMd().format(value!);
                                    }
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    elevation: 30,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(false, Icons.edit);
                  });
              cubit.changeBottomSheetState(true, Icons.add);
                }
              },
              child: Icon(cubit.fabicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 100,
              backgroundColor: Colors.grey[300],
              //showSelectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
            body: //tasks.length==0?Center(child: CircularProgressIndicator()):screens[currentIndex],
            ConditionalBuilder(
              condition: states is! AppGetLoadingStateDatabaseState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}



