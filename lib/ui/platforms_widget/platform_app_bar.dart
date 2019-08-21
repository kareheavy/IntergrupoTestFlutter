import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'platform_widget.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar>
    implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final PreferredSizeWidget androidBottom;
  final List<Widget> actions;

  PlatformAppBar({
    this.leading,
    this.title,
    this.androidBottom,
    this.actions,
  });

  @override
  AppBar createAndroidWidget(BuildContext context) => AppBar(
        leading: this.leading,
        title: this.title,
        bottom: androidBottom,
        actions: actions,
      );

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) =>
      CupertinoNavigationBar(
        leading: this.leading,
        middle: this.title,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: actions ?? [],
        ),
      );

  @override
  Size get preferredSize {
    if (Platform.isAndroid) {
      return Size.fromHeight(
          kToolbarHeight + (androidBottom?.preferredSize?.height ?? 0.0));
    } else {
      return const Size.fromHeight(44.0);
    }
  }
}
