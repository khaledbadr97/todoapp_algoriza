import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  late Database db;
  TextEditingController TitleController = TextEditingController();
  TextEditingController DatelineController = TextEditingController();
  TextEditingController StartTimeController = TextEditingController();
  TextEditingController EndTimeController = TextEditingController();
  TextEditingController RemindController = TextEditingController();
  TextEditingController RepeatController = TextEditingController();
  DateTime selectedDateNow = DateTime.now();

  List<Map> Tasks = [];
  List<Map> CompletedTasks = [];
  List<Map> UnCompletedTasks = [];
  List<Map> FavoriteTasks = [];

  List <Color> TabColors =
  [
    Colors.blue.shade400,
    Colors.pink.shade400,
    Colors.orange.shade400,
    Colors.yellow.shade600
  ];

  //Create and Open DataBase and Table
  void CreatDataBase() async
  {
    await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async
      {
        debugPrint('DataBase is Created');
        await database
            .execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, dateline TEXT, starttime TEXT, endtime TEXT,remind TEXT,repreat TEXT ,iscompleted INTEGER , is_fav TEXT,status TEXT)')
            .then((value) {
          debugPrint('Table created');
          emit(AppDataBaseTableCreatedState());
        }).catchError((error) {
          debugPrint('Error when Create Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        db = database;
        GetDataFromDataBase();
        debugPrint('open DataBase');
      },
    ).then((value) {
      db = value;
      emit(AppCreateDataBaseState());
    });
  }

  void InsertDataBase({ bool isFav =false}) async
  {
    await db.transaction((txn) async
    {
      txn.rawInsert(
          'INSERT INTO Tasks(title, dateline,starttime,endtime,remind,repreat,iscompleted,status, is_fav) VALUES("${TitleController.text}"," ${DatelineController.text}", "${StartTimeController.text}","${EndTimeController.text}","${RemindController.text}","${RepeatController.text}","0","unCompleted" ,"${isFav}")')
          .then((value) {
        debugPrint('$value insert succefuly');
        TitleController.clear();
        DatelineController.clear();
        StartTimeController.clear();
        EndTimeController.clear();
        RemindController.clear();
        RepeatController.clear();
        GetDataFromDataBase();
        emit(AppInsertDataBaseState());
      }).catchError((error) {
        debugPrint('Error when insert new  ${error.toString()}');
      });
    });
  }

  void GetDataFromDataBase() async
  {
    Tasks = [];
    CompletedTasks=[];
    UnCompletedTasks=[];
    FavoriteTasks = [];
    emit(AppGetDataBaseLoadingState());
    db.rawQuery('SELECT * FROM Tasks').then((value)
    {
      Tasks = value;
      value.forEach((element)
      {
        if (element['status'] == 'completed')
        {
          CompletedTasks.add(element);
        }
        else if (element['status'] == 'unCompleted')
        {
          UnCompletedTasks.add(element);
        }
        if (element['is_fav'] == 'true')
        {
          FavoriteTasks.add(element);
        }

      });
      debugPrint(Tasks.toString());
      emit(AppGetDataBaseState());
    });
  }

  void DeleteItem({required int id}) async
  {
    db.rawDelete('DELETE FROM Tasks WHERE id = ?', ['$id']).then((value)
    {
      GetDataFromDataBase();
      debugPrint('Success Item Deleted');
      emit(AppDeleteItemState());
    });
  }

  void MoveDataBaseScreen({required String status, required int id}) async
  {
    emit(AppMoveDataBaseScreenState());
    db.rawUpdate('UPDATE Tasks SET status = ?   WHERE id = ?',
        ['$status', '$id']).then((value)
    {
      GetDataFromDataBase();
      emit(AppMoveDataBaseScreenState());
    });
  }

  void MarkIsCompleted({required int id, required int iscompleted,}){
    emit(AppMarkIsCompletedState());
    db.rawUpdate('UPDATE Tasks SET iscompleted = ?  WHERE id = ?',
        ['$iscompleted', '$id']).then((value)
    {
      GetDataFromDataBase();
      emit(AppMarkIsCompletedState());
    });
  }

  /*late NotifyHelper notifyHelper;

  void Notification()
  {
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
    emit(NotificationAppState());
  }*/


  void setIsChecked({required bool value})
  {
    value = !value;
    emit(AppSetCheckedSuccess(value));
  }

  void SetIsFav(Map<dynamic, dynamic> model)
  {
    emit(AppSetFavLoadingState());
    db.rawUpdate(
        'UPDATE tasks SET is_fav = "${model['is_fav'] == 'true' ? 'false' : 'true'}" WHERE id = "${model['id']}"')
        .then((value)
    {
      print('${model['title']} is updated successfully');
      emit(AppSetFavSuccessfulState());
      GetDataFromDataBase();
    }).catchError((error)
    {
      print('Error when update ${model['title']} ${error.toString()}');
      emit(AppSetFavErrorState(error));
    });
  }

  DateTime? scheduleDate;

  void SetScheduleDate(DateTime date)
  {
    scheduleDate = date;
    emit(SelectedDateLineValueState());
  }


}