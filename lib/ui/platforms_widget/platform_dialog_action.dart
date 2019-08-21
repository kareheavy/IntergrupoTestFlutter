import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/platforms_widget/platform_widget.dart';

class PlatformDialogAction
    extends PlatformWidget<CupertinoDialogAction, FlatButton> {
  final String text;
  final VoidCallback onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  PlatformDialogAction({
    @required this.text,
    @required this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  @override
  FlatButton createAndroidWidget(BuildContext context) {
    return FlatButton(
      child: Text(text.toUpperCase()),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoDialogAction createIosWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: Text(text),
      onPressed: onPressed,
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }
}
