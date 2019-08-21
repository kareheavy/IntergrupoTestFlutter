import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'platform_progress_indicator.dart';
import 'platform_widget.dart';

class PlatformButton extends PlatformWidget<Widget, Widget> {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  PlatformButton({
    @required this.text,
    @required this.onPressed,
    this.isLoading = false,
  }) : assert(text != null);

  @override
  Widget createAndroidWidget(BuildContext context) {
    return RaisedButton(
      child: isLoading
          ? Container(
              width: 25.0,
              height: 25.0,
              child: PlatformProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
      onPressed: onPressed,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return CupertinoButton.filled(
      child: isLoading
          ? Container(
              width: 20.0,
              height: 20.0,
              child: PlatformProgressIndicator(),
            )
          : Text(text),
      onPressed: onPressed,
    );
  }
}
