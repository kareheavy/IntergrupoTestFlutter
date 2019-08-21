import 'package:models/sign_in_request.dart';
import 'package:models/sign_in_response.dart';
import 'package:domain/sign_in_use_case.dart';

abstract class SignInApiSource {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

class SignInRepositoryImpl implements SignInRepository {
  final SignInApiSource _apiSource;

  SignInRepositoryImpl(this._apiSource);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) {
    return _apiSource.signIn(signInRequest);
  }
}
