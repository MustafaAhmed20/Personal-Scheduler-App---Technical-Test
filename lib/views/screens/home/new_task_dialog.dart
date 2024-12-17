import 'package:flutter/material.dart';

import 'package:scheduler/data/data.dart';
import 'package:intl/intl.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scheduler/navigator_settings.dart';
import 'package:scheduler/views/constants/constants.dart';

//
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'logic.dart';

double get createTaskDialogHeight => 0.7.sh;

class CreateTaskDialog extends StatefulWidget {
  //
  final DateTime date;

  //
  const CreateTaskDialog({
    super.key,
    required this.date,
  });

  @override
  _CreateTaskDialogState createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  /// task name
  String? taskName;

  ///
  DateTime? startTime;

  ///
  DateTime? endTime;

  // Priority options
  TaskPriority _selectedPriority = TaskPriority.low;

  // Categories options
  final Set<TaskCategory> _addedTaskCategories = {};

  void _onCancel() {
    if (mounted) {
      AppNavigationHandler.popPage();
    }
  }

  //
  void _onCreateTask() {
    // Validate fields

    if (taskName?.isEmpty ?? true) {
      _showErrorMessage('Task name is required.');
      return;
    }

    //
    if (startTime == null || endTime == null) {
      _showErrorMessage('Start & End time is required.');
      return;
    }

    if (!endTime!.isAfter(startTime!)) {
      _showErrorMessage('Start time must be after End time.');
      return;
    }

    // Categories
    if (_addedTaskCategories.isEmpty) {
      _showErrorMessage('At least one Category must be chosen.');
      return;
    }

    //
    // Submit form
    addNewTask(
      taskPriority: _selectedPriority,
      taskDate: widget.date,
      //
      taskName: taskName,
      taskStartMoment: startTime!,
      taskEndMoment: endTime!,
      categories: _addedTaskCategories,
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkRedColor3,
        content: Text(
          message,
          style: AppTextStyle.textStyle12.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.down,
      onDismissed: (direction) => _onCancel(),
      child: Container(
        height: createTaskDialogHeight,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            5.h.verticalSpace,

            // Top line
            Align(
              child: Container(
                width: 50.w,
                height: 4.5.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGray29,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ),

            //
            10.h.verticalSpace,

            //
            Padding(
              padding: EdgeInsetsDirectional.only(start: 8.w, end: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Task',
                    style: AppTextStyle.textStyle20.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MMM/yy').format(widget.date),
                    style: AppTextStyle.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            //
            10.h.verticalSpace,

            // Task Name
            FormBuilderTextField(
              name: 'task_name',
              initialValue: taskName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                  borderSide: BorderSide.none,
                ),
                fillColor: AppColors.lightGray,
                filled: true,
                hintText: 'Task name',
                hintStyle: AppTextStyle.textStyle12.copyWith(
                  color: AppColors.lightGray2,
                ),
              ),
              onChanged: (value) {
                taskName = value;
              },
              validator: FormBuilderValidators.required(),
            ),

            //
            20.h.verticalSpace,

            //
            // Start and End Times
            Container(
              constraints: BoxConstraints(minHeight: 80.h),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                children: [
                  // Start
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.lightGray29,
                        radius: 12.r,
                        child: startTime != null
                            ? Icon(
                                Icons.check,
                                size: 14.sp,
                                color: Colors.green,
                              )
                            : null,
                      ),

                      //
                      5.w.horizontalSpace,

                      //
                      Text(
                        'Start',
                        style: AppTextStyle.textStyle12.copyWith(
                          color: AppColors.lightGray44,
                        ),
                      ),

                      //
                      const Spacer(),

                      //
                      SizedBox(
                        width: 200.w,
                        height: 45.h,
                        child: FormBuilderDateTimePicker(
                          name: 'start',
                          inputType: InputType.time,
                          initialValue: startTime,
                          currentDate: DateTime.now(),
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          format: DateFormat('HH:mm'),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyle12.copyWith(
                            color: Colors.black,
                            letterSpacing: 1.3.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (date) {
                            if (date != null) {
                              setState(() {
                                startTime = date;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  //
                  10.h.verticalSpace,

                  // End
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.lightGray29,
                        radius: 12.r,
                        child: endTime != null
                            ? Icon(
                                Icons.check,
                                size: 14.sp,
                                color: Colors.green,
                              )
                            : null,
                      ),

                      //
                      5.w.horizontalSpace,

                      //
                      Text(
                        'End',
                        style: AppTextStyle.textStyle12.copyWith(
                          color: AppColors.lightGray44,
                        ),
                      ),

                      //
                      const Spacer(),

                      //
                      SizedBox(
                        width: 200.w,
                        height: 45.h,
                        child: FormBuilderDateTimePicker(
                          name: 'start',
                          inputType: InputType.time,
                          initialValue: endTime,
                          currentDate: DateTime.now(),
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          format: DateFormat('HH:mm'),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyle12.copyWith(
                            color: Colors.black,
                            letterSpacing: 1.3.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (date) {
                            if (date != null) {
                              setState(() {
                                endTime = date;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //
            20.h.verticalSpace,

            // Priority
            Text(
              "Priority",
              style: AppTextStyle.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            //
            10.h.verticalSpace,

            // Priority
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var priority in TaskPriority.values)
                  _buildPriorityButton(priority),
              ],
            ),

            20.h.verticalSpace,

            // Categories
            Text(
              "Categories",
              style: AppTextStyle.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            //
            10.h.verticalSpace,

            Container(
              constraints: BoxConstraints(minHeight: 45.h, minWidth: 1.sw),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Wrap(
                  spacing: 10,
                  children: TaskCategory.values.map((category) {
                    return _buildCategoryChip(category);
                  }).toList()),
            ),

            20.h.verticalSpace,

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildActionButton(
                    title: "Cancel",
                    backgroundColor: Colors.grey[300]!,
                    textColor: Colors.black,
                    onClick: _onCancel,
                  ),
                ),

                //
                5.w.horizontalSpace,

                //
                Expanded(
                  child: _buildActionButton(
                    title: "Create Task",
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    onClick: _onCreateTask,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Priority Button Widget
  Widget _buildPriorityButton(TaskPriority priority) {
    bool isSelected = priority == _selectedPriority;

    return SizedBox(
      width: 100.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedPriority = priority;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          backgroundColor: isSelected ? priority.color : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
            side: BorderSide(color: priority.color),
          ),
        ),
        child: Text(
          priority.label,
          style: TextStyle(
            color: isSelected ? Colors.white : priority.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Category Chip Widget
  Widget _buildCategoryChip(TaskCategory category) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isAdded = _addedTaskCategories.contains(category);
        return FilterChip(
          label: Text(
            category.label,
            style: AppTextStyle.textStyle12.copyWith(
              color: isAdded ? Colors.white : Colors.black,
            ),
          ),
          selected: isAdded,
          onSelected: (isSelected) {
            setState(() {
              if (isAdded) {
                _addedTaskCategories.remove(category);
              } else {
                _addedTaskCategories.add(category);
              }
            });
          },
          backgroundColor: Colors.grey[200],
          selectedColor: category.color,
          checkmarkColor: Colors.white,
        );
      },
    );
  }

  // Action Buttons
  Widget _buildActionButton({
    required String title,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onClick,
  }) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
        ),
        onPressed: onClick,
        child: Text(
          title,
          style: AppTextStyle.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
