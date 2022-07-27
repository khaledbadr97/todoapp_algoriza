import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class UnCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          var Tasks = cubit.UnCompletedTasks;

          return AppCubit.get(context).UnCompletedTasks.isEmpty
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
                              item:
                              AppCubit.get(context).UnCompletedTasks[index],
                              color: cubit
                                  .TabColors[index % cubit.TabColors.length],
                            ),
                        itemCount:
                        AppCubit.get(context).UnCompletedTasks.length),
                  ),
                );
        });
  }
}
