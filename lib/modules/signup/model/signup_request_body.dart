import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String phone;
    final String gender;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;


  SignupRequestBody({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.name,
    required this.phone,
    required this.gender,
  });

  factory SignupRequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$SignupRequestBodyFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SignupRequestBodyToJson(this);
}
