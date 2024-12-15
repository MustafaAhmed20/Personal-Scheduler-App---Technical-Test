/// all the local images used in this App.

part of 'constants.dart';

/// A wrapper for images Or icon
class AppImageIcon {
  late String link;
  late String ext;

  bool get isSvgImage => ext == 'svg';

  /// [folderName] inside the assets folder
  AppImageIcon({
    required String link,
    String folderName = 'images',
    this.ext = 'png',
  }) {
    this.link = 'assets/$folderName/$link.$ext';
  }
}

/// all images in the App
abstract class AppImages {
  static final appLogo = AppImageIcon(link: 'logo', ext: 'jpg');

  static final profile = AppImageIcon(link: 'profile');

  static final alertTriangle = AppImageIcon(link: 'alert_triangle');

  // on Boarding
  static final onBoarding1 = AppImageIcon(link: 'on_boarding_1');
  static final onBoarding2 = AppImageIcon(link: 'on_boarding_2');
  static final onBoarding3 = AppImageIcon(link: 'on_boarding_3');

  // classes
  static final class1 = AppImageIcon(link: 'class_1');
  static final class2 = AppImageIcon(link: 'class_2');
  static final class3 = AppImageIcon(link: 'class_3');

  static final camera = AppImageIcon(link: 'camera');
  static final gallery = AppImageIcon(link: 'gallery');
  static final files = AppImageIcon(link: 'files');

  //
  static final competitionLeaderboardCirclesBackground =
      AppImageIcon(link: 'competition_leaderboard_circles_background');

  // leaderboard
  static final leaderboard = AppImageIcon(link: 'leaderboard');
}

/// all icons inside the App
abstract class AppIcons {
  /// The folder name contains the icons
  static const String _folderName = 'icons';

  static final search =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'search');

  static final flag =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'flag');

  static final idInputNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'id_input_not_selected');

  static final idInputSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'id_input_selected');

  static final profileInputNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'profile_input_not_selected');

  static final profileInputSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'profile_input_selected');

  static final calendarNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'calendar_not_selected');

  static final arrowDown =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'arrow_down');

  static final lockSelected =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'lock_selected');

  static final lockNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'lock_not_selected');

  static final eyeActivatedNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'eye_activated_not_selected');

  static final eyeActivatedSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'eye_activated_selected');

  // eye not activated (hide)

  static final eyeNotActivatedNotSelected = AppImageIcon(
      folderName: _folderName,
      ext: 'svg',
      link: 'eye_not_activated_not_selected');

  static final eyeNotActivatedSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'eye_not_activated_selected');

  // OTP
  //

  static final otpMessageNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'otp_message_not_selected');

  static final otpMessageSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'otp_message_selected');

  static final otpEmailNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'otp_email_not_selected');

  static final otpEmailSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'otp_email_selected');

  // Navigation
  //

  static final navigationMoreNotSelected = AppImageIcon(
      folderName: _folderName,
      ext: 'svg',
      link: 'navigation_more_not_selected');

  static final navigationMoreSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'navigation_more_selected');

  static final navigationLessonsNotSelected = AppImageIcon(
      folderName: _folderName,
      ext: 'svg',
      link: 'navigation_lessons_not_selected');

  static final navigationLessonsSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'navigation_lessons_selected');

  static final navigationHomeNotSelected = AppImageIcon(
      folderName: _folderName,
      ext: 'svg',
      link: 'navigation_home_not_selected');

  static final navigationHomeSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'navigation_home_selected');

  static final navigationGradesNotSelected = AppImageIcon(
      folderName: _folderName,
      ext: 'svg',
      link: 'navigation_grades_not_selected');

  static final navigationGradesSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'navigation_grades_selected');

  // More tap
  //

  static final backArrow =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'back_arrow');

  // Notifications
  static final notificationNotSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'notification_not_selected');

  static final notificationSelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'notification_selected');

  static final moreDanger =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_danger');

  static final moreBoard =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_board');

  static final moreBoardGreen = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'more_board_green');

  static final moreChart =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_chart');

  static final moreTrophy =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_trophy');

  static final moreQuran =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_quran');

  static final moreTrophySelected = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'more_trophy_selected');

  static final moreTimer =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_timer');

  static final moreCalendarConfirmed = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'more_calendar_confirmed');

  static final moreMessages =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_messages');

  static final moreLogout =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_logout');

  //
  // Classes

  static final classesStudentsGreen =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'students_green');

  static final classesStudentsBlue =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'students_blue');

  static final classesArrowGraphUpGreen = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'arrow_graph_up_green');

  static final classesArrowGraphUpRed = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'arrow_graph_up_red');

  static final classesGraduationHat =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'graduation_hat');

  static final classesPercentageCircle = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'percentage_circle');

  static final classesHandShake =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'hand_shake');

  static final classesGraph =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'graph');

  static final locationPin =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'location_pin');

  // Ranks

  static final rankNoNumber =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'rank_no_number');

  static final rank1 =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'rank_1');

  static final rank2 =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'rank_2');

  static final rank3 =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'rank_3');

  //
  static final moreSquare =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'more_square');

  static final editGreen =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'edit_green');

  static final deleteRed =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'delete_red');

  //
  static final arrowGreenForward = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'arrow_green_forward');

  // Medals
  static final medalRed =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'medal_red');

  static final medalGreen =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'medal_green');

  static final medalBlue =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'medal_blue');

  //
  static final clockWhite =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'clock');

  static final crown =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'crown');

  static final change =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'change');

  //
  // Evaluation shapes

  static final evaluationShapeBlue = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'evaluation_shape_blue');

  static final evaluationShapeGreen = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'evaluation_shape_green');

  static final evaluationShapePink = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'evaluation_shape_pink');

  static final evaluationShapeBrown = AppImageIcon(
      folderName: _folderName, ext: 'svg', link: 'evaluation_shape_brown');

  ///
  static final sendMessage =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'send_message');

  //

  static final muslimShape =
      AppImageIcon(folderName: _folderName, ext: 'svg', link: 'muslim_shape');
}
