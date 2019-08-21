
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/platforms_widget/platform_widget.dart';

class PlatformAlertDialog
    extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    @required this.actions,
  });

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
