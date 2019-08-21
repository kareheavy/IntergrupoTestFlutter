import 'dart:convert';

SignInRequest signInRequestFromJson(String str) => SignInRequest.fromJson(json.decode(str));

String signInRequestToJson(SignInRequest data) => json.encode(data.toJson());

class SignInRequest {
  String email;
  String password;

  SignInRequest({
    this.email,
    this.password,
  });

  factory SignInRequest.fromJson(Map<String, String> json) => new SignInRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, String> toJson() => {
    "email": email,
    "password": password,
  };
}
