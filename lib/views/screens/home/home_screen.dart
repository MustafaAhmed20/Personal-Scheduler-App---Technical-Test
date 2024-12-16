import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:intl/intl.dart' show DateFormat;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler/data/data.dart';
import 'package:scheduler/views/constants/constants.dart';
import 'package:scheduler/views/widgets/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onNewTask() {}

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(
        taskDate: DateTime.now(),
        taskEndMoment: DateTime.now(),
        taskStartMoment: DateTime.now(),
        //
        taskPriority: TaskPriority.low,
        taskName: 'First task',
      ),
      Task(
        taskDate: DateTime.now(),
        taskEndMoment: DateTime.now(),
        taskStartMoment: DateTime.now(),
        //
        taskPriority: TaskPriority.med,
        taskName: 'Second task',
      ),
      Task(
        taskDate: DateTime.now(),
        taskEndMoment: DateTime.now(),
        taskStartMoment: DateTime.now(),
        //
        taskPriority: TaskPriority.high,
        taskName: 'Third task',
      ),
    ];

    return AppScaffold(
      // New task
      floatingActionButton: FloatingActionButton(
        onPressed: _onNewTask,
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28.sp,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //

          8.h.verticalSpace,

          const _UserHeader(),

          8.h.verticalSpace,

          _DatePickerCard(
            onChangeSelectedDate: (date) {},
          ),

          10.h.verticalSpace,

          // Task Timeline
          Expanded(
            child: ListView.separated(
              itemCount: tasks.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsetsDirectional.only(
                top: 10.h,
                bottom: 20.h,
                end: 8.w,
                start: 8.w,
              ),
              separatorBuilder: (context, index) => 8.h.verticalSpace,
              itemBuilder: (context, index) {
                var task = tasks[index];

                return TaskCard(
                  task: task,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Header with user information
class _UserHeader extends StatelessWidget {
  const _UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          // user image
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.blue,
          ),

          //
          5.w.horizontalSpace,

          //
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Text(
                  'User name',
                  style: AppTextStyle.textStyle12,
                ),

                //
                1.h.verticalSpace,

                Text(
                  'Sub-title',
                  style: AppTextStyle.textStyle10,
                ),
              ],
            ),
          ),

          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20.sp,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 20.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Card for picking the date
class _DatePickerCard extends StatefulWidget {
  //
  final DateTime? selectedDay;

  final void Function(DateTime date) onChangeSelectedDate;

  const _DatePickerCard({
    super.key,
    this.selectedDay,
    required this.onChangeSelectedDate,
  });

  @override
  State<_DatePickerCard> createState() => _DatePickerCardState();
}

class _DatePickerCardState extends State<_DatePickerCard> {
  final Duration _oneDayDuration = const Duration(days: 1);

  late DateTime selectedDay;

  void _onChangeSelectedDay(DateTime date) {
    setState(() {
      selectedDay = date;
    });

    //
    widget.onChangeSelectedDate(date);
  }

  @override
  void initState() {
    selectedDay = widget.selectedDay ?? DateTime.now();

    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // dates that will be showed
    List<DateTime> dates = [
      selectedDay.subtract(_oneDayDuration * 3),

      selectedDay.subtract(_oneDayDuration * 2),

      // Yesterday
      selectedDay.subtract(_oneDayDuration),

      // current
      selectedDay,

      // tomorrow
      selectedDay.add(_oneDayDuration),

      //
      selectedDay.add(_oneDayDuration * 2),

      selectedDay.add(_oneDayDuration * 3),
    ];

    //
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// date picker
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: FormBuilderDateTimePicker(
              key: ValueKey(selectedDay),
              name: 'day',
              inputType: InputType.date,
              initialValue: selectedDay,
              currentDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.day,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              format: DateFormat('MMMM yyyy'),
              style: AppTextStyle.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (date) {
                if (date != null) {
                  _onChangeSelectedDay(date);
                }
              },
            ),
          ),

          5.h.verticalSpace,

          // Date Navigation Bar
          Container(
            height: 82.h,
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
            child: Row(
              children: [
                for (int index = 0; index < dates.length; index++)
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        var date = dates[index];

                        var isSelected = _isSameDay(date, selectedDay);

                        bool isLastItem = index == dates.length - 1;

                        //
                        return Padding(
                          padding: isLastItem
                              ? EdgeInsets.zero
                              : EdgeInsetsDirectional.only(end: 5.w),
                          child: _dateItem(
                            isSelected: isSelected,
                            date: date,
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  Widget _dateItem({
    required DateTime date,
    required isSelected,
  }) {
    String dayName = DateFormat('EEE').format(date);

    Color labelColor = isSelected ? Colors.white : Colors.black;

    return TextButton(
      onPressed: () {
        // change selected date
        _onChangeSelectedDay(date);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
        ),
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                dayName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: labelColor,
                ),
              ),
            ),

            //
            4.h.verticalSpace,

            Text(
              "${date.day}",
              style: AppTextStyle.textStyle16.copyWith(
                color: labelColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Task Card Widget
class TaskCard extends StatelessWidget {
  //
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _hourFormatter(task.taskStartMoment),
                  style: AppTextStyle.textStyle12.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),

                //
                Text(
                  _hourFormatter(task.taskEndMoment),
                  style: AppTextStyle.textStyle12.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          //
          Container(
            height: 80.h,
            width: 4.w,
            decoration: BoxDecoration(
              color: task.taskPriority.color,
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),

          //
          Expanded(
            child: Container(
              height: 80.h,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: task.taskPriority.color.withOpacity(0.4),
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(12.sp),
                  bottomEnd: Radius.circular(12.sp),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // task name
                  Text(
                    task.taskName ?? '',
                    style: AppTextStyle.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //
                  8.h.verticalSpace,

                  // time of the task
                  Text.rich(
                    TextSpan(
                      text: _hourFormatter(task.taskStartMoment),
                      children: [
                        const TextSpan(text: ' - '),

                        //
                        TextSpan(
                          text: _hourFormatter(task.taskEndMoment),
                        ),
                      ],
                    ),
                    style: AppTextStyle.textStyle14.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _hourFormatter(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }
}
