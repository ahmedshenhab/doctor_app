import 'package:json_annotation/json_annotation.dart';
part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  final String message;
  final Data data;
  final bool status;
  final int code;

  SignupResponseBody({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory SignupResponseBody.fromJson(
    Map<String, dynamic> json,
  ) => _$SignupResponseBodyFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SignupResponseBodyToJson(this);
}

@JsonSerializable()
class Data {
  Data({required this.token, required this.userName});

  final String token;

  @JsonKey(name: 'username')
  final String userName;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
