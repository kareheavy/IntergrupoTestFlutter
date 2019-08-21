import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_app/ui/platforms_widget/platform_app.dart';
import 'package:flutter_app/ui/sign_in_page.dart';
import 'package:flutter_app/utils/strings_localizations.dart';

class FlutterApp extends StatelessWidget {
  final bool debugBanner;

  FlutterApp(this.debugBanner);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      localizationsDelegates: [
        StringLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
      ],
      home: SignInPage(),
      debugShowCheckedModeBanner: debugBanner,
    );
  }
}
