import 'package:flutter/material.dart';

import 'package:scheduler/views/constants/constants.dart';

import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

enum TaskPriority {
  low(AppColors.primaryLight3, "Low"),
  med(AppColors.lightPurple, "Med"),
  high(AppColors.darkRedColor7, "High");

  const TaskPriority(this.color, this.label);

  final Color color;
  final String label;
}

enum TaskCategory {
  work(AppColors.primaryLight3, "Work"),
  personal(AppColors.lightPurple, "Personal"),
  fun(AppColors.lightGreen2, "Fun"),
  study(AppColors.lightYellow1, "Study");

  const TaskCategory(this.color, this.label);

  final Color color;
  final String label;
}

@JsonSerializable(explicitToJson: true)
class Task {
  //
  TaskPriority taskPriority;

  /// Categories
  Set<TaskCategory> categories;

  @JsonKey(name: 'task_name')
  String? taskName;

  //
  @JsonKey(name: 'task_date')
  DateTime taskDate;

  @JsonKey(name: 'task_start_moment')
  DateTime taskStartMoment;

  @JsonKey(name: 'task_end_moment')
  DateTime taskEndMoment;

  /// Rid of time data
  static DateTime dateWithoutTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Task({
    required this.taskPriority,
    this.taskName,
    this.categories = const {},
    //
    required this.taskDate,
    required this.taskStartMoment,
    required this.taskEndMoment,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
