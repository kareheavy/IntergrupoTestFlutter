import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return new Container();
  }
}
