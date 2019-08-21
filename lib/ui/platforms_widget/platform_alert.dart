import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/platforms_widget/platform_alert_dialog.dart';
import 'package:flutter_app/ui/platforms_widget/platform_dialog_action.dart';

class PlatformAlert {
  static Future<T> _setupPlatformDialog<T>(
      BuildContext context, WidgetBuilder builder) {
    if (Platform.isAndroid) {
      return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: false,
      );
    } else {
      return showCupertinoDialog<T>(
        context: context,
        builder: builder,
      );
    }
  }

  static Future<T> showPlatformDialog<T>({
    @required BuildContext context,
    String title,
    String content,
    String positiveTextButton,
    final VoidCallback positiveOnPressed,
    String destructiveTextButton,
    final VoidCallback destructiveOnPressed,
    String negativeTextButton,
    final VoidCallback negativeOnPressed,
  }) {
    Widget titleW = title != null ? Text(title) : null;
    Widget contentW = content != null ? Text(content) : null;
    var actions = <Widget>[];
    if (negativeTextButton != null) {
      actions.add(PlatformDialogAction(
        text: negativeTextButton,
        onPressed: negativeOnPressed,
      ));
    }
    if (positiveTextButton != null) {
      actions.add(PlatformDialogAction(
        text: positiveTextButton,
        onPressed: positiveOnPressed,
        isDefaultAction: true,
      ));
    }
    if (destructiveTextButton != null) {
      actions.add(PlatformDialogAction(
        text: destructiveTextButton,
        onPressed: destructiveOnPressed,
        isDestructiveAction: true,
      ));
    }
    return _setupPlatformDialog(
      context,
          (context) => PlatformAlertDialog(
        title: titleW,
        content: contentW,
        actions: actions,
      ),
    );
  }
}
