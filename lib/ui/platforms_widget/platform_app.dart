import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_widget.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final Widget home;
  final bool debugShowCheckedModeBanner;

  PlatformApp({
    this.localizationsDelegates,
    this.supportedLocales,
    this.home,
    this.debugShowCheckedModeBanner = true
  });

  @override
  MaterialApp createAndroidWidget(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.blue,
        cursorColor: Colors.blue,
      ),
    );
  }

  @override
  CupertinoApp createIosWidget(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: home,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
    );
  }
}
