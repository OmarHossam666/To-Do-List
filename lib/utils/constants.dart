import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:prodigy_ad_02/utils/app_strings.dart';

dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStrings.oopsMessage,
    subMsg: "You Must Fill All The Required Fields!",
    corner: 20,
    duration: 2000,
    padding: const EdgeInsets.all(20),
    color: Colors.black,
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStrings.oopsMessage,
    subMsg: "You Must Edit The Task First, Then Try To Update It!",
    corner: 20,
    duration: 2000,
    padding: const EdgeInsets.all(20),
    color: Colors.black,
  );
}

dynamic noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: AppStrings.oopsMessage,
    message:
        "There is no task to delete!\ntry to add a task and then delete it!",
    buttonText: "Okay",
    onTapDismiss: () => Navigator.pop(context),
    panaraDialogType: PanaraDialogType.error,
  );
}

dynamic deleteAllTasks(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: AppStrings.areYouSure,
    message:
        "Do you really want to delete all the tasks?\nYou won't be able to undo this action!",
    confirmButtonText: 'Yes',
    cancelButtonText: 'No',
    onTapConfirm: () {
      // BaseWidget.of(context).dataStore.box.clear();
      Navigator.pop(context);
    },
    onTapCancel: () => Navigator.pop(context),
    panaraDialogType: PanaraDialogType.error,
  );
}
