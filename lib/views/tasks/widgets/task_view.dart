import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:prodigy_ad_02/extensions/space_extension.dart';
import 'package:prodigy_ad_02/main.dart';
import 'package:prodigy_ad_02/models/task.dart';
import 'package:prodigy_ad_02/utils/app_colors.dart';
import 'package:prodigy_ad_02/utils/app_strings.dart';
import 'package:prodigy_ad_02/utils/constants.dart';
import 'package:prodigy_ad_02/views/tasks/components/date_time.dart';
import 'package:prodigy_ad_02/views/tasks/components/rep_text_field.dart';
import 'package:prodigy_ad_02/views/tasks/widgets/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
    required this.titleTaskController,
    required this.descriptionTaskController,
    required this.task,
  });

  final TextEditingController? titleTaskController;
  final TextEditingController? descriptionTaskController;
  final Task? task;

  @override
  State<StatefulWidget> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var title;
  var subTitle;
  DateTime? time;
  DateTime? date;

  String showTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateFormat("hh:mm a").format(DateTime.now()).toString();
      }
      else {
        return DateFormat("hh:mm a").format(time).toString();
      }
    }
    else {
      return DateFormat("hh:mm a").format(widget.task!.createdAtTime).toString();
    }
  }

  String showDate(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      }
      else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    }
    else {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateTime.now();
      }
      else {
        return date;
      }
    }
    else {
      return widget.task!.createdAtDate;
    }
  }

  bool isTaskAlreadyExist() {
    if (widget.titleTaskController?.text != null &&
        widget.descriptionTaskController?.text != null) {
      return true;
    } else {
      return false;
    }
  }

  void isTaskAlreadyExistUpdateOtherWiseCreate() {
    if (widget.titleTaskController?.text != null && widget.descriptionTaskController?.text != null) {
      try {
        widget.titleTaskController?.text = title;
        widget.descriptionTaskController?.text = subTitle;

        widget.task?.save();

        Navigator.pop(context);
      }
      catch (error) {
        updateTaskWarning(context);
      }
    }
    else {
      if (title != null && subTitle != null) {
        Task task = Task.create(
          title: title,
          subTitle: subTitle,
          createdAtDate: date,
          createdAtTime: time,
          );
          BaseWidget.of(context).dataStore.addTask(task: task);
          
          Navigator.pop(context);
      }
      else {
        emptyWarning(context);
      }
    }
  }

  dynamic deleteTask() {
    return widget.task?.delete();
  }

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
                        text: TextSpan(
                            text: isTaskAlreadyExist() ? AppStrings.updateCurrentTask : AppStrings.addNewTask,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              color: Colors.black,
                            ),
                            children: const [
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
                      RepTextField(
                        controller: widget.titleTaskController,
                        onFieldSubmitted: (String inputTitle) {
                          title = inputTitle;
                        },
                        onChanged: (String inputTitle) {
                          title = inputTitle;
                        },
                      ),
                      10.height,
                      RepTextField(
                        controller: widget.descriptionTaskController,
                        isForDescription: true,
                        onFieldSubmitted: (String inputSubTitle) {
                          subTitle = inputSubTitle;
                        },
                        onChanged: (String inputSubTitle) {
                          subTitle = inputSubTitle;
                        },
                      ),
                      DateTimeSelectionWidget(
                        title: AppStrings.timeString,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                    height: 280,
                                    child: TimePickerWidget(
                                      initDateTime: showDateAsDateTime(time),
                                      dateFormat: "HH:mm",
                                      onChange: (dateTime, selectedIndex) {},
                                      onConfirm: (dateTime, selectedIndex) {
                                        setState(() {
                                          if (widget.task?.createdAtTime == null) {
                                            time = dateTime;
                                          }
                                          else {
                                            widget.task?.createdAtTime = dateTime;
                                          }
                                        });
                                      },
                                    ),
                                  ));
                        },
                        time: showTime(time),
                        isTime: true,
                      ),
                      DateTimeSelectionWidget(
                        title: AppStrings.dateString,
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            initialDateTime: showDateAsDateTime(date),
                            maxDateTime: DateTime(2050, 9, 5),
                            minDateTime: DateTime.now(),
                            onConfirm: (dateTime, selectedIndex) {
                              setState(() {
                                if (widget.task?.createdAtDate == null) {
                                  date = dateTime;
                                } else {
                                  widget.task?.createdAtDate = dateTime;
                                }
                              });
                            },
                          );
                        }, time: showDate(date),
                        isTime: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: isTaskAlreadyExist() ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                    children: [
                      isTaskAlreadyExist() ? MaterialButton(
                        onPressed: () {
                            deleteTask();
                            Navigator.pop(context);
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
                      ) : Container(),
                      MaterialButton(
                        onPressed: () {
                          isTaskAlreadyExistUpdateOtherWiseCreate();
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
                            Text(
                              isTaskAlreadyExist() ? AppStrings.updateTaskString : AppStrings.addTaskString,
                              style: const TextStyle(
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