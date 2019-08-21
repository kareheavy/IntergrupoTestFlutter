import 'dart:convert';

CustomException customExceptionFromJson(String str) => CustomException.fromJson(json.decode(str));

String customExceptionToJson(CustomException data) => json.encode(data.toJson());

class CustomException implements Exception {
  int code;
  String error;
  Map<String, String> errorsCode;

  CustomException({
    this.code = 0,
    this.error = "",
  });

  CustomException.constructorErrorsMap(this.code, this.errorsCode);

  factory CustomException.fromJson(Map<String, dynamic> json) => new CustomException(
    code: json["code"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
  };
}
