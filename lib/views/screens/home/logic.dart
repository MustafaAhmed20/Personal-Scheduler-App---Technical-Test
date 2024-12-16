import 'package:flutter/cupertino.dart';
import 'package:scheduler/views/widgets/alert_screen.dart';

import 'new_task_dialog.dart';

// ********************
// **** HomeScreen ****
// ********************

/// from home screen - push the new task dialog
void pushNewTaskDialog() {
  //
  showBlurAlertScreen(
    effects: moveBottomUpEffect(childHeight: createTaskDialogHeight),
    alignmentOfChild: Alignment.bottomCenter,
    popWhenClickOutsideChild: false,
    child: CreateTaskDialog(),
  );
}
