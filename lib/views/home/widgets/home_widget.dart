import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/extensions/space_extension.dart';
import 'package:prodigy_ad_02/main.dart';
import 'package:prodigy_ad_02/models/task.dart';
import 'package:prodigy_ad_02/utils/app_colors.dart';
import 'package:prodigy_ad_02/utils/app_strings.dart';
import 'package:prodigy_ad_02/views/home/widgets/task_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.textTheme, 
    required this.base, 
    required this.tasks,
  });

  final TextTheme textTheme;
  final BaseWidget base;
  final List<Task> tasks;

    int valueOfIndicator(List<Task> tasks) {
    if (tasks.isNotEmpty) {
      return tasks.length;
    } 
    else {
      return 3;
    }
  }

  int checkDoneTask(List<Task> tasks) {
    int counter = 0;

    for (Task task in tasks) {
      if (task.isCompleted) {
        counter++;
      }
    }

    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 60),
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  value: checkDoneTask(tasks) / valueOfIndicator(tasks),
                  backgroundColor: Colors.grey,
                  valueColor: const AlwaysStoppedAnimation(AppColors.primaryColor),
                ),
              ),
              25.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.mainTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  3.height,
                  Text(
                    "${checkDoneTask(tasks)} of ${tasks.length} task",
                    style: textTheme.titleMedium,
                  ),
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(thickness: 2, indent: 100),
        ),
        SizedBox(
            width: double.infinity,
            height: 440,
            child: tasks.isNotEmpty
                ? ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var task = tasks[index];

                      return Dismissible(
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          base.dataStore.deleteTask(task: task);
                        },
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.black,
                            ),
                            8.width,
                            const Text(
                              AppStrings.deletedTask,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        key: Key(task.id),
                        child: TaskWidget(task: task),
                        );
                    },
                    scrollDirection: Axis.vertical,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_task_sharp,
                        size: 100,
                        color: Colors.black,
                      ),
                      FadeInUp(
                          from: 30,
                          child: const Text(
                            AppStrings.doneAllTasks,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                )
      ]),
    );
  }
}