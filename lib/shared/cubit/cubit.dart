import 'package:bloc/bloc.dart';
import 'package:firstapp/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archived/archived_taskScreen.dart';
import '../../modules/doneTasks/done_taskScreen.dart';
import '../../modules/tasks/new_taskScreen.dart';
import '../componants/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(initialAppState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  late Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];
  List<Widget> screens = [
    newTask(),
    doneTask(),
    archivedTask(),
  ];
  List<String> titles = ['Tasks', 'Done Tasks', 'Archived Tasks'];
  bool isBottomSheet = false;
  IconData fabicon = Icons.edit;
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT , status TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error: ${error.toString()}');
        });
      },
      onOpen: (database) {
        getFromDatabase(database);
        print('database opened');
      },
    ).then((Database? value) {
      database = value!;
      emit(AppCreateDatabaseState());
    });
  }

 insertDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, date ,time, status)VALUES("$title","$date","$time","new")')
          .then((value) {
        print('data inserted succssefully ${value.toString()}');
        emit(AppInsertDatabaseState());
        getFromDatabase(database);

      }).catchError((error) {
        print('error ${error.toString()}');
      });
      return null;
    });
  }

  void getFromDatabase(database)  {
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    emit(AppGetLoadingStateDatabaseState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status']=='new'){
          newtasks.add(element);
        }
        else if(element['status']=='done'){
          donetasks.add(element);
        }
        else archivedtasks.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }
  void updateData(
  {
  required String status,
  required int id,
}
      )async
  {
    return  database.rawUpdate(
        'UPDATE tasks SET status= ? WHERE id = ?',
        ['$status', id]).then((value) {
          getFromDatabase(database);
          emit(AppUpdateDataBase());
    });
  }
  void deleteData(
      {
        required int id,
      }
      )async
  {
    return  database.rawDelete(
        'DELETE FROM tasks WHERE id= ?' ,
        [id]).then((value) {
      getFromDatabase(database);
      emit(AppDeleteDataBase());
    });
  }

  void changeBottomSheetState(
      bool isShow,
      IconData icon,
      ){
    isBottomSheet=isShow;
    fabicon=icon;
    emit(AppChangeBottomSheetState());

  }
}
