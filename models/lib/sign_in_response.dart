import 'dart:convert';

SignInResponse signInResultFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResultToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  bool success;
  String authToken;
  String email;

  SignInResponse({
    this.success,
    this.authToken,
    this.email,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => new SignInResponse(
    success: json["success"],
    authToken: json["authToken"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "authToken": authToken,
    "email": email,
  };
}
