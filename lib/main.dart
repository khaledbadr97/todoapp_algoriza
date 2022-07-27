import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/board_screen.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/styles/themes.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(()
  {
    runApp(MyApp());
  },
  );
}

class MyApp extends StatelessWidget
{

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create:(BuildContext context )=> AppCubit()..CreatDataBase())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: lightTheme,
        home: BoardScreen(),
      ),
    );
  }
}


