import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:prodigy_ad_02/extensions/space_extension.dart';
import 'package:prodigy_ad_02/utils/app_colors.dart';
import 'package:prodigy_ad_02/utils/app_strings.dart';
import 'package:prodigy_ad_02/views/tasks/components/date_time.dart';
import 'package:prodigy_ad_02/views/tasks/components/rep_text_field.dart';
import 'package:prodigy_ad_02/views/tasks/widgets/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<StatefulWidget> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: AppStrings.addNewTask,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: AppStrings.taskString,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          AppStrings.titleOfTitleTextField,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RepTextField(controller: titleTaskController),
                      10.height,
                      RepTextField(
                          controller: descriptionTaskController,
                          isForDescription: true),
                      DateTimeSelectionWidget(
                        title: AppStrings.timeString,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                    height: 280,
                                    child: TimePickerWidget(
                                      onChange: (dateTime, selectedIndex) {},
                                      dateFormat: "HH:mm",
                                      onConfirm: (dateTime, selectedIndex) {
                                        // Later.
                                      },
                                    ),
                                  ));
                        },
                      ),
                      DateTimeSelectionWidget(
                        title: AppStrings.dateString,
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            maxDateTime: DateTime(2050, 9, 5),
                            minDateTime: DateTime.now(),
                            onConfirm: (dateTime, selectedIndex) {
                              // Later.
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          // Delete the current task
                        },
                        minWidth: 150,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 55,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.close_rounded,
                              color: AppColors.primaryColor,
                              ),
                            5.width,
                            const Text(
                              AppStrings.deleteTask,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Add or Update Task
                        },
                        minWidth: 150,
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 55,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add_task_rounded,
                              color: Colors.white,
                            ),
                            5.width,
                            const Text(
                              AppStrings.addTaskString,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
