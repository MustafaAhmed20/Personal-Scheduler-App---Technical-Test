// ignore_for_file: use_build_context_synchronously

import 'package:provider/provider.dart';
import 'package:scheduler/data/data.dart';

import 'package:scheduler/navigator_settings.dart';

// screens
import 'package:scheduler/views/screens/home/home_screen.dart';
import 'package:scheduler/views/screens/login/login_screen.dart';

/// The first function will run on the App.
///
/// Will be used to load settings data
///
/// Splash screen won't popped until this complete
Future<void> firstAppDataLoader() async {
  var context = AppNavigationHandler.getBuildContext;

  // all app necessary data
  await Future.wait([
    // Authorization
    Provider.of<AuthorizationProvider>(context, listen: false).init(),
  ]);
}

/// wait some time before navigate away from splash screen
Future<void> navigateFromSplashAfterSomeTime() async {
  var context = AppNavigationHandler.getBuildContext;

  bool isLoggedIn =
      Provider.of<AuthorizationProvider>(context, listen: false).isLoggedIn;

  if (isLoggedIn) {
    AppNavigationHandler.pushPage(
      childPageToPage: const HomeScreen(),
      popAllScreenFirst: true,
    );
  } else {
    // Go to login
    AppNavigationHandler.pushPage(
      childPageToPage: const LoginScreen(),
      usePushReplacement: true,
    );
  }
}
