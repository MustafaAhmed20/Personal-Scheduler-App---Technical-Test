import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler/navigator_settings.dart';
import 'package:scheduler/views/constants/constants.dart';

// splash
import 'package:scheduler/views/splash/splash_screen.dart';

import 'data/data.dart';

void main() {
  runZonedGuarded(
    () async {
      FlutterError.onError = (FlutterErrorDetails details) {
        // Report error to server or LOG service
      };

      PlatformDispatcher.instance.onError = (exception, stackTrace) {
        // Report error to server or LOG service
        return true;
      };

      //
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AuthorizationProvider(),
            ),
            ChangeNotifierProvider(create: (context) => TasksProvider()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (Object error, StackTrace stack) async {
      // Report error to server or LOG service
    },
  );
}

class MyApp extends StatelessWidget {
  //
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Personal Scheduler',
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigationHandler.appNavigatorKey,
            theme: ThemeData(
              useMaterial3: true,
              textTheme: AppFontsFamilies.defaultTheme,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
                primary: AppColors.primary,
                secondary: AppColors.primary,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  fixedSize: Size(345.w, 56.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
