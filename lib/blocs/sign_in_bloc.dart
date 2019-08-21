import 'package:dash/dash.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/di/inject_domain_in_app.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:models/sign_in_response.dart';
import 'package:domain/sign_in_use_case.dart';
import 'package:models/sign_in_request.dart';
import 'package:models/custom_exception.dart';

class SignInBloc extends Bloc {
  final SignInUseCase _signInUseCase;

  final _isLoadingSubject = BehaviorSubject<bool>();
  final _remenberMeSubject = BehaviorSubject<bool>();
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();

  SignInBloc(this._signInUseCase) {
    _isLoadingSubject.value = false;
  }

  ValueObservable<bool> get isLoading => _isLoadingSubject.stream;

  ValueObservable<bool> get remenberMe => _remenberMeSubject.stream;

  ValueObservable<String> get email => _emailSubject.stream;

  ValueObservable<String> get password => _passwordSubject.stream;

  @override
  dispose() {
    _isLoadingSubject.close();
    _remenberMeSubject.close();
    _emailSubject.close();
    _passwordSubject.close();
  }

  Future<SignInResponse> signIn(SignInRequest signInRequest) {
    _isLoadingSubject.value = true;
    _emailSubject.value = null;
    _passwordSubject.value = null;

    return _signInUseCase.signIn(signInRequest).then((result) {
      return result;
    }).catchError((error) {
      if (error is CustomException) {
        if (error.code == 0) {
          _emailSubject.value = error.errorsCode[ErrorsConstants.emptyEmail];
          _passwordSubject.value =
              error.errorsCode[ErrorsConstants.emptyPassword];
        } else {
          throw error;
        }
      }
    }).whenComplete(() {
      _isLoadingSubject.value = false;
    });
  }

  static Bloc instance() => SignInBloc(Injector().provideSecurityUseCase());

  void getCredentials() {
    _emailSubject.value = "text";
    _passwordSubject.value = "text";
  }
}
