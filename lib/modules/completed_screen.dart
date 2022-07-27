import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class CompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          var Tasks = cubit.CompletedTasks;

          return AppCubit.get(context).CompletedTasks.isEmpty
              ? Expanded(
                  child: EmptyScreen(),
                )
              : Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      AppCubit.get(context).GetDataFromDataBase();
                    },
                    child: ListView.builder(
                        itemBuilder: (context, index) => BuildTask(
                              item: AppCubit.get(context).CompletedTasks[index],
                              color: cubit
                                  .TabColors[index % cubit.TabColors.length],
                            ),
                        itemCount: AppCubit.get(context).CompletedTasks.length),
                  ),
                );
        });
  }
}
