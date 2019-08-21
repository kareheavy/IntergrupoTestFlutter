import 'package:domain/sign_in_use_case.dart';
import 'package:data/sign_in_repository.dart';
import 'package:flutter_app/di/inject_data_source.dart';

class RepositoryInjector {
  static RepositoryInjector _singleton;

  factory RepositoryInjector() {
    if (_singleton == null) {
      _singleton = RepositoryInjector._();
    }
    return _singleton;
  }

  RepositoryInjector._();

  SignInRepository provideSignInRepository() {
    return SignInRepositoryImpl(DataSourceInjector().provideSignInApiSource());
  }
}
