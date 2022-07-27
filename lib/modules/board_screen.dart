import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/schedule_screen.dart';
import 'package:todo_app/modules/tab_bar_screen.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';
import 'package:todo_app/styles/colors.dart';

class BoardScreen extends StatelessWidget
{

  var ScaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit,AppStates>(
      listener:(BuildContext context,AppStates state){} ,
      builder: (BuildContext context,AppStates state){
        AppCubit cubit = AppCubit.get(context);


        return  DefaultTabController(
            length: 4,
            child: Scaffold(
                key: ScaffoldKey,
                appBar:AppBar(
                  title: Text('Board',style: TextStyle(fontSize: 25)) ,

                  actions: [
                    CustomIconButton(onTap: (){ NavigateTo(context: context,router: ScheduleScreen());},
                        Widgeticon: Icon(Icons.date_range,color: defaultColor)),


                  ],

                ),
                body: TabBarScreen()
            )

        );

      },
    );
  }
}
