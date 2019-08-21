import 'package:domain/sign_in_use_case.dart';
import 'inject_data_in_domain.dart';

class Injector {
  static Injector _singleton;

  factory Injector() {
    if (_singleton == null) {
      _singleton = Injector._();
    }
    return _singleton;
  }

  Injector._();

  SignInUseCase provideSecurityUseCase() {
    return SignInUseCaseImpl(RepositoryInjector().provideSignInRepository());
  }
}
