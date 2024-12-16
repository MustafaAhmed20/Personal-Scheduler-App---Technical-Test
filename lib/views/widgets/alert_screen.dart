import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:scheduler/navigator_settings.dart';
import 'package:scheduler/views/constants/constants.dart';
import 'package:sprung/sprung.dart';

/// The default effect for the alert child
List<Effect<dynamic>> defaultScaleBounceEffect = const [
  ScaleEffect(
    duration: Duration(milliseconds: 500),
    begin: Offset(0.85, 0.85),
    end: Offset(1.0, 1.0),
    curve: Curves.bounceOut,
  )
];

/// moving effect from bottom up
///
/// [childHeight] is to make the child starts from the same height of the child
List<Effect<dynamic>> moveBottomUpEffect({
  required double childHeight,
}) =>
    [
      MoveEffect(
        duration: const Duration(milliseconds: 600),
        begin: Offset(0, childHeight),
        end: Offset.zero,
        curve: Sprung.custom(
          mass: 1,
          damping: 20,
          stiffness: 80,
        ),
      ),
    ];

/// The screen blur type
enum BlurType {
  blue,
  softBlack,
}

/// show a Blurred screen for alerts
///
/// [child] is the alert Widget on the screen
///
/// [popWhenClickOutsideChild] when true means the screen will pop when click outside of the child
///
/// [alignmentOfChild] is the Alignment of the child on the screen
///
/// [usePushReplacement] if ture will user push replacement
///
/// [effects] The animation effects applied on the child. default is [defaultEffect]
Future<dynamic> showBlurAlertScreen({
  required Widget child,
  BlurType blurType = BlurType.blue,
  AlignmentGeometry alignmentOfChild = Alignment.center,
  bool popWhenClickOutsideChild = true,
  bool usePushReplacement = false,
  List<Effect<dynamic>>? effects,
  Duration? automaticallyPopAfter,
  bool resizeToAvoidBottomInset = false,
}) {
  /// push the Blurred
  return AppNavigationHandler.pushPage(
    usePushReplacement: usePushReplacement,
    childPageToPage: _BlurredAlertScreen(
      alignment: alignmentOfChild,
      blurType: blurType,
      popWhenClickOutsideChild: popWhenClickOutsideChild,
      effects: effects ?? defaultScaleBounceEffect,
      automaticallyPopAfter: automaticallyPopAfter,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      child: child,
    ),
  );
}

/// a screen with Blurred background for alerts and confirms screens
class _BlurredAlertScreen extends StatefulWidget {
  /// The Alignment of the child in the screen
  final AlignmentGeometry alignment;

  final BlurType blurType;

  ///
  final Widget child;

  final bool popWhenClickOutsideChild;

  /// The effect the animation
  final List<Effect<dynamic>> effects;

  final Duration? automaticallyPopAfter;

  final bool resizeToAvoidBottomInset;

  const _BlurredAlertScreen({
    super.key,
    required this.blurType,
    required this.alignment,
    required this.child,
    required this.popWhenClickOutsideChild,
    required this.effects,
    required this.automaticallyPopAfter,
    required this.resizeToAvoidBottomInset,
  });

  @override
  State<_BlurredAlertScreen> createState() => _BlurredAlertScreenState();
}

class _BlurredAlertScreenState extends State<_BlurredAlertScreen> {
  void popPage() {
    if (!widget.popWhenClickOutsideChild) return;
    _pop();
  }

  void _pop() {
    if (mounted) {
      AppNavigationHandler.popPage();
    }
  }

  @override
  void initState() {
    if (widget.automaticallyPopAfter != null) {
      Future.delayed(widget.automaticallyPopAfter!)
          .then((value) => Future.microtask(_pop));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      ),
      child: Scaffold(
        backgroundColor: widget.blurType == BlurType.blue
            ? AppColors.primary.withOpacity(0.2)
            : AppColors.black.withOpacity(0.2),
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: TapRegion(
          onTapOutside: (event) => popPage(),
          child: Align(
            alignment: widget.alignment,
            child: Animate(
              effects: widget.effects,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
