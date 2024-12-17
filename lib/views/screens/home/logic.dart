import 'package:flutter/cupertino.dart';
import 'package:scheduler/navigator_settings.dart';
import 'package:scheduler/views/screens/login/login_screen.dart';
import 'package:scheduler/views/widgets/alert_screen.dart';
import 'package:scheduler/views/widgets/exit_app_confirmation.dart';

import 'package:provider/provider.dart';
import 'package:scheduler/data/data.dart';

import 'new_task_dialog.dart';

// ********************
// **** HomeScreen ****
// ********************

Future<void> loadAllUserTasks() async {
  var context = AppNavigationHandler.getBuildContext;

  await Provider.of<TasksProvider>(context, listen: false).loadUserTasks();
}

/// from home screen - push the new task dialog
void pushNewTaskDialog({
  required DateTime date,
}) {
  //
  showBlurAlertScreen(
    effects: moveBottomUpEffect(childHeight: createTaskDialogHeight),
    alignmentOfChild: Alignment.bottomCenter,
    popWhenClickOutsideChild: false,
    child: CreateTaskDialog(
      date: date,
    ),
  );
}

/// From top actions button - logout
void onLogout() async {
  var context = AppNavigationHandler.getBuildContext;

  bool result = await showConfirmAlertDialog(
    'Confirm',
    'Are you sure you want to logout?',
  );

  //
  if (!result) return;

  // Logout
  Provider.of<AuthorizationProvider>(context, listen: false).logoutUser();
  Provider.of<TasksProvider>(context, listen: false).clearUserTasks();

  // go back to login screen

  AppNavigationHandler.pushPage(
    popAllScreenFirst: true,
    childPageToPage: const LoginScreen(),
  );
}

// ****************************
// **** Create Task Dialog ****
// ****************************

Future<void> addNewTask({
  required String? taskName,
  required Set<TaskCategory>? categories,
  required TaskPriority taskPriority,
  //
  required DateTime taskDate,
  required DateTime taskStartMoment,
  required DateTime taskEndMoment,
}) async {
  var context = AppNavigationHandler.getBuildContext;

  await Provider.of<TasksProvider>(context, listen: false).addNewTask(
    taskPriority: taskPriority,

    //
    taskName: taskName,
    categories: categories,
    taskDate: taskDate,
    taskStartMoment: taskStartMoment,
    taskEndMoment: taskEndMoment,
  );

  // exit the dialog
  AppNavigationHandler.popPage();
}

Future<void> deleteTask({
  required Task task,
  bool confirmFirst = false,
}) async {
  var context = AppNavigationHandler.getBuildContext;

  if (confirmFirst) {
    bool result = await confirmDeleteTask();

    if (!result) return;
  }

  await Provider.of<TasksProvider>(context, listen: false)
      .deleteTask(task: task);
}

Future<bool> confirmDeleteTask() async {
  return showConfirmAlertDialog(
    'Confirm',
    'Are you sure you want to delete this task?',
  );
}
