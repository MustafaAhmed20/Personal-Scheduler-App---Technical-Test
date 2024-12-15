part of 'constants.dart';

/// if the tow dates are the same date
///
/// only comparing year & month & day
bool isSameDay(DateTime date, DateTime other) {
  return date.year == other.year &&
      date.month == other.month &&
      date.day == other.day;
}

/// The days names with the number of the [DateTime.weekday]
Map<int, String> daysNames = {
  1: 'الاثنين',
  2: 'الثلاثاء',
  3: 'الاربعاء',
  4: 'الخميس',
  5: 'الجمعه',
  6: 'السبت',
  7: 'الاحد',
};

/// months names with the ids in the [DateTime.month]
Map<int, String> monthsNames = {
  1: 'يناير',
  2: 'فبراير',
  3: 'مارس',
  4: 'أبريل',
  5: 'مايو',
  6: 'يونيو',
  7: 'يوليو',
  8: 'أغسطس',
  9: 'سبتمبر',
  10: 'أكتوبر',
  11: 'نوفمبر',
  12: 'ديسمبر',
};
