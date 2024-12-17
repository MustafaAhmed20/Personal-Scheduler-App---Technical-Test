import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler/views/constants/constants.dart';

import 'logic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var firstLoader = firstAppDataLoader();

    /// push next page
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Future.microtask(() async {
        // make sure the first loader is complete
        await firstLoader;

        navigateFromSplashAfterSomeTime();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
              ),

              //
              20.h.verticalSpace,

              // app name
              Text(
                'Personal Scheduler',
                style: AppTextStyle.textStyle20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
