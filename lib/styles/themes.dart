import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  iconTheme: IconThemeData(color: Colors.grey,size:25),
  appBarTheme: const AppBarTheme(
    titleSpacing: 25,
    iconTheme: IconThemeData(color: Colors.black),
//backwardsCompatibility: true,
    backgroundColor: Colors.white,
    elevation: 1,
    titleTextStyle: TextStyle(
      color:Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness:Brightness.dark,


    ),
  ),
  tabBarTheme:  TabBarTheme(
    labelColor: defaultColor,
    unselectedLabelColor: Colors.grey,
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3,color: defaultColor),
        insets: EdgeInsets.symmetric(horizontal: 30)
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 1,vertical: 3),

  ),


  textTheme:  TextTheme(
    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
    bodyText2:  TextStyle(fontSize: 16, color: Colors.black),
    headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),

  ),
);