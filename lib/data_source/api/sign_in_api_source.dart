import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import 'package:data/sign_in_repository.dart';
import 'package:models/sign_in_response.dart';
import 'package:models/sign_in_request.dart';
import 'package:models/custom_exception.dart';
import 'package:flutter_app/data_source/api/api_client.dart';
import 'package:flutter_app/utils/constants.dart';

class SignInApiSourceImpl implements SignInApiSource {
  final String baseUrl;

  SignInApiSourceImpl(this.baseUrl);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return Future(() {
        throw new CustomException(
            code: ErrorsType.notInternet, error: ErrorsConstants.internetNotAvailable);
      });
    }

    var client = ApiClient(http.Client());
    try {
      var url = Uri.http(baseUrl, "application/login", signInRequest.toJson());
      var response = await client.get(url).timeout(client.timeout);
      if (response.statusCode == 200) {
        return SignInResponse.fromJson(json.decode(response.body));
      } else {
        throw CustomException.fromJson(json.decode(response.body));
      }
    } finally {
      client.close();
    }
  }
}
