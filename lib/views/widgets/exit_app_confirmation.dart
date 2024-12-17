import 'package:flutter/material.dart';
import 'package:scheduler/navigator_settings.dart';
import 'package:scheduler/views/constants/constants.dart';

/// shows an alert before taking action.
///
/// - **Default** [cancelString] is ```AppLocalizations.of(context)!.dialog_cancel```
/// - **Default** [confirmString] is ```AppLocalizations.of(context)!.dialog_confirm```
Future<bool> showConfirmAlertDialog(
  String title,
  String question, {
  String? cancelString,
  String? confirmString,
}) async {
  BuildContext context = AppNavigationHandler.getBuildContext;

  String usedCancel = "Cancel";

  String usedConfirm = "Confirm";

  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title,
            style: AppTextStyle.textStyle14.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            question,
            style: AppTextStyle.textStyle16.copyWith(),
          ),
          actions: <Widget>[
            //
            TextButton(
              onPressed: () => AppNavigationHandler.popPage(false),
              child: Text(
                usedCancel,
                style: AppTextStyle.textStyle14.copyWith(),
              ),
            ),

            //
            TextButton(
              onPressed: () => AppNavigationHandler.popPage(true),
              child: Text(
                usedConfirm,
                style: AppTextStyle.textStyle14.copyWith(
                  color: AppColors.darkRedColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ) ??
      false;
}
