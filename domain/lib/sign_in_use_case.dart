import 'package:models/sign_in_request.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:models/custom_exception.dart';
import 'package:models/sign_in_response.dart';

abstract class SignInRepository {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

abstract class SignInUseCase {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

class SignInUseCaseImpl implements SignInUseCase {
  final SignInRepository _repository;

  SignInUseCaseImpl(this._repository);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) {
    var errors = Map<String, String>();

    if (signInRequest.email.isEmpty) {
      errors[ErrorsConstants.emptyEmail] = ErrorsConstants.emptyEmail;
    }

    if (signInRequest.password.isEmpty) {
      errors[ErrorsConstants.emptyPassword] = ErrorsConstants.emptyPassword;
    }

    if (errors.length > 0) {
      return Future(() {
        throw new CustomException.constructorErrorsMap(
            ErrorsType.empty, errors);
      });
    }

    return _repository.signIn(signInRequest);
  }
}
