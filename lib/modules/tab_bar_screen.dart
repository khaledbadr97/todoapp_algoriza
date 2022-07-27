import 'package:flutter/material.dart';
import 'package:todo_app/layout/todo_screen.dart';
import 'package:todo_app/modules/completed_screen.dart';
import 'package:todo_app/modules/create_task_screen.dart';
import 'package:todo_app/modules/favorite_screen.dart';
import 'package:todo_app/modules/uncompleted_screen.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/components/constants.dart';

class TabBarScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        //Tab Title
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))
          ),
          child: const TabBar(
            tabs:
            [
              Tab(text:'All',),
              Tab(text:'Completed',),
              Tab(text:'UnCompleted',),
              Tab(text:'Favorite',),
            ],
          ),
        ),
        //Screens
        Expanded(
          child: TabBarView(
            children:
            [
              TodoScreen(),
              CompletedScreen(),
              UnCompletedScreen(),
              FavoriteScreen(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15,right: 25,left: 25),
          child: CustomButton(text: 'Create Task', onTap: ()
          {
            NavigateTo(context: context,router:  CreateTaskScreen());
          }),
        ),
      ],
    );
  }
}
