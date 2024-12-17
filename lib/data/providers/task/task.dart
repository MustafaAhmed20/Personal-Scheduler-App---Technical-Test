import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:scheduler/data/data.dart';
import 'package:scheduler/navigator_settings.dart';

//
import 'package:shared_preferences/shared_preferences.dart';

class TasksProvider extends ChangeNotifier {
  /// user tasks
  ///
  /// Date : tasks
  Map<DateTime, List<Task>> tasks = {};

  // *****************************************************
  // ****************** Functionality ********************
  // *****************************************************

  /// clear all tasks. Useful on Logout
  void clearUserTasks({
    bool useNotifyListeners = false,
  }) {
    tasks.clear();

    //
    if (useNotifyListeners) {
      notifyListeners();
    }
  }

  /// load all user tasks
  Future<void> loadUserTasks() async {
    await _loadUserTasksFromDisk();

    notifyListeners();
  }

  Future<void> addNewTask({
    required String? taskName,
    required Set<TaskCategory>? categories,
    required TaskPriority taskPriority,
    //
    required DateTime taskDate,
    required DateTime taskStartMoment,
    required DateTime taskEndMoment,
  }) async {
    Task newTask = Task(
      taskName: taskName,
      categories: categories ?? {},
      taskPriority: taskPriority,
      taskDate: taskDate,
      taskStartMoment: taskStartMoment,
      taskEndMoment: taskEndMoment,
    );

    tasks
        .putIfAbsent(Task.dateWithoutTime(newTask.taskDate), () => [])
        .add(newTask);

    // sort with start time
    tasks[Task.dateWithoutTime(newTask.taskDate)]!
        .sort((a, b) => a.taskStartMoment.compareTo(b.taskStartMoment));

    // save it to disk
    _saveUserTasksToDisk();
    notifyListeners();
  }

  ///
  Future<void> deleteTask({
    required Task task,
  }) async {
    tasks[Task.dateWithoutTime(task.taskDate)]?.removeWhere(
      (element) =>
          element.taskName == task.taskName &&
          element.taskStartMoment == task.taskStartMoment,
    );

    // save it to disk
    _saveUserTasksToDisk();
    notifyListeners();
  }

  // *****************************************************
  // ******************** save data **********************
  // *****************************************************

  ///
  Future<void> _saveUserTasksToDisk() async {
    var context = AppNavigationHandler.getBuildContext;

    // get user
    User? loggedInUser =
        Provider.of<AuthorizationProvider>(context, listen: false).loggedInUser;

    if (loggedInUser == null || loggedInUser.email == null) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = tasks.map(
      (key, value) {
        return MapEntry<String, dynamic>(
          key.toIso8601String(),
          value.map((task) => task.toJson()).toList(),
        );
      },
    );

    prefs.setString('tasks:${loggedInUser.email}', jsonEncode(data));
  }

  ///
  Future<void> _loadUserTasksFromDisk() async {
    var context = AppNavigationHandler.getBuildContext;

    // get user
    User? loggedInUser =
        Provider.of<AuthorizationProvider>(context, listen: false).loggedInUser;

    if (loggedInUser == null || loggedInUser.email == null) return;

    //
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString('tasks:${loggedInUser.email}');

    if (data?.isEmpty ?? true) return;

    Map<String, dynamic> dataDecoded = jsonDecode(data!);

    tasks = dataDecoded.map(
      (key, value) {
        return MapEntry(
          DateTime.parse(key),
          (value as List).map((e) => Task.fromJson(e)).toList(),
        );
      },
    );
  }
}
