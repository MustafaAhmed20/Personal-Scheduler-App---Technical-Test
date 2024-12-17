// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskPriority: $enumDecode(_$TaskPriorityEnumMap, json['taskPriority']),
      taskName: json['task_name'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TaskCategoryEnumMap, e))
              .toSet() ??
          const {},
      taskDate: DateTime.parse(json['task_date'] as String),
      taskStartMoment: DateTime.parse(json['task_start_moment'] as String),
      taskEndMoment: DateTime.parse(json['task_end_moment'] as String),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskPriority': _$TaskPriorityEnumMap[instance.taskPriority]!,
      'categories':
          instance.categories.map((e) => _$TaskCategoryEnumMap[e]!).toList(),
      'task_name': instance.taskName,
      'task_date': instance.taskDate.toIso8601String(),
      'task_start_moment': instance.taskStartMoment.toIso8601String(),
      'task_end_moment': instance.taskEndMoment.toIso8601String(),
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.med: 'med',
  TaskPriority.high: 'high',
};

const _$TaskCategoryEnumMap = {
  TaskCategory.work: 'work',
  TaskCategory.personal: 'personal',
  TaskCategory.fun: 'fun',
  TaskCategory.study: 'study',
};
