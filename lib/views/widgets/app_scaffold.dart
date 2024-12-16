import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  //
  final Widget child;

  /// default is [Colors.white]
  final Color? backgroundColor;

  //
  final Widget? bottomNavigationBar;

  final Widget? floatingActionButton;

  final bool useSafeArea;

  const AppScaffold({
    super.key,
    required this.child,
    this.useSafeArea = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor ?? Colors.white,
      body: SafeArea(
        top: useSafeArea,
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: child,
        ),
      ),
    );
  }
}
