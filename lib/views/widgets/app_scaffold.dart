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

/// screen header with title and back button
///
/// **NOTE**: the height is [40.r]
// class AppScreenHeader extends StatelessWidget {
//   final bool showBackButton;
//
//   /// override the default [AppNavigationHandler.popPage()]
//   final VoidCallback? onBackButton;
//
//   /// text title
//   final String? title;
//
//   /// a widget to place in the middle of the app bar
//   final Widget? titleWidget;
//
//   final TextStyle? titleTextStyle;
//
//   const AppScreenHeader({
//     super.key,
//     this.showBackButton = true,
//     this.onBackButton,
//     this.title,
//     this.titleWidget,
//     this.titleTextStyle,
//   });
//
//   //
//   void onBack() {
//     if (onBackButton != null) {
//       onBackButton!.call();
//       return;
//     }
//     AppNavigationHandler.popPage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double appbarHeight = 40.r;
//
//     return Padding(
//       padding: EdgeInsetsDirectional.only(
//         top: 24.h,
//       ),
//       child: SizedBox(
//         height: appbarHeight,
//         child: Stack(
//           children: [
//             // back button
//             if (showBackButton)
//               Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Container(
//                   width: appbarHeight + 20.w,
//                   margin: EdgeInsetsDirectional.only(start: 10.w),
//                   child: TextButton(
//                     onPressed: onBack,
//                     // onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                     ),
//                     child: Icon(
//                       Icons.arrow_back_ios_new,
//                       size: 18.r,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//
//             // Title
//             if (title != null)
//               Align(
//                 child: Text(
//                   title!,
//                   style: titleTextStyle ??
//                       AppTextStyle.textStyle24.copyWith(
//                         fontWeight: FontWeight.w600,
//                       ),
//                 ),
//               ),
//
//             if (titleWidget != null)
//               Align(
//                 child: titleWidget!,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
