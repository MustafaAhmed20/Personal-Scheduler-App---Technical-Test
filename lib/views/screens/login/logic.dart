import 'package:provider/provider.dart';
import 'package:scheduler/data/data.dart';

import 'package:scheduler/navigator_settings.dart';

//
import 'package:scheduler/views/screens/home/home_screen.dart';
import 'package:scheduler/views/widgets/toast.dart';

/// From login screen. push home screen
void loginAndPushHomeScreen({
  required String email,
  required String password,
}) async {
  var context = AppNavigationHandler.getBuildContext;

  // First check the credentials
  // Here can wait dialog can be shown
  bool result = await Provider.of<AuthorizationProvider>(context, listen: false)
      .loginUser(
    email: email,
    password: password,
  );

  if (!result) {
    // show error message
    showMessageToast(text: 'Login Failed');

    return;
  }

  //
  AppNavigationHandler.pushPage(
    childPageToPage: const HomeScreen(),
    transitionType: PageTransitionType.rightToLeft,
    pageTransitionSpeed: AppNavigationHandler.pageTransitionSpeed3,
    popAllScreenFirst: true,
  );
}
