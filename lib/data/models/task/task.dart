import 'package:flutter/material.dart';
import 'package:scheduler/views/constants/constants.dart';

import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

enum TaskPriority {
  low(AppColors.primaryLight3),
  med(AppColors.lightPurple),
  high(AppColors.darkRedColor7);

  const TaskPriority(this.color);

  final Color color;
}

@JsonSerializable(explicitToJson: true)
class Task {
  //
  TaskPriority taskPriority;

  @JsonKey(name: 'task_name')
  String? taskName;

  //
  @JsonKey(name: 'task_date')
  DateTime taskDate;

  @JsonKey(name: 'task_start_moment')
  DateTime taskStartMoment;

  @JsonKey(name: 'task_end_moment')
  DateTime taskEndMoment;

  Task({
    required this.taskPriority,
    this.taskName,
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
