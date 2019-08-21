import 'package:flutter/material.dart';

import 'package:flutter_app/app/flutter_app.dart';
import 'package:flutter_app/app/settings/app_settings.dart';
import 'package:flutter_app/app/settings/application.dart';
import 'package:flutter_app/data_source/preferences/preferences_source.dart';

void main() async {
  var appSettings = AppSettings(baseUrl: "directotesting.igapps.co");
  Application().appSettings = appSettings;
  await PreferencesSources().initPrefs();

  runApp(FlutterApp(true));
}
