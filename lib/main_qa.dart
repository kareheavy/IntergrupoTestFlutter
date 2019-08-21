import 'package:flutter/material.dart';

import 'package:flutter_app/app/flutter_app.dart';
import 'package:flutter_app/app/settings/app_settings.dart';
import 'package:flutter_app/app/settings/application.dart';

void main() {
  var appSettings = AppSettings(baseUrl: "QA");

  Application().appSettings = appSettings;

  runApp(FlutterApp(true));
}