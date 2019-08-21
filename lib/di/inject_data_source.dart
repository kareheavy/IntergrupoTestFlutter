import 'package:flutter_app/app/settings/application.dart';
import 'package:flutter_app/data_source/api/sign_in_api_source.dart';
import 'package:data/sign_in_repository.dart';

class DataSourceInjector {
  static DataSourceInjector _singleton;

  factory DataSourceInjector() {
    if (_singleton == null) {
      _singleton = DataSourceInjector._();
    }
    return _singleton;
  }

  DataSourceInjector._();

  SignInApiSource provideSignInApiSource() {
    return SignInApiSourceImpl(Application().appSettings.baseUrl);
  }
}
