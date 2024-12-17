import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:overlay_support/overlay_support.dart' as overlay_support;
import 'package:scheduler/views/constants/constants.dart';

/// show Message Toast
void showMessageToast({
  required String text,
  Color backgroundColor = AppColors.darkRedColor,
  List<BoxShadow>? boxShadow,
  BorderRadiusGeometry? borderRadius,
  TextStyle? textStyle,
  Size? size,
}) {
  Widget child = Container(
    constraints: BoxConstraints.tight(size ?? Size(350.w, 50.h)),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(25.sp),
      color: backgroundColor,
      boxShadow: boxShadow,
    ),
    child: Text(
      text,
      style: textStyle ??
          AppTextStyle.textStyle14.copyWith(
            // color: AppColors.lightBlue2,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
    ),
  );

  //
  showCustomToast(child: child);
}

/// show custom Toast
void showCustomToast({
  required Widget child,
  AlignmentGeometry alignment = const Alignment(0, 0.618),
  Curve curve = Curves.ease,
}) {
  overlay_support.showOverlay(
    curve: curve,
    (context, progress) {
      return IgnorePointer(
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: alignment,
            child: Opacity(
              opacity: progress,
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
