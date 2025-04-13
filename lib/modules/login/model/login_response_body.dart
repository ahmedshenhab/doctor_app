
import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String message;
  final Data data;
  final bool status;
  final int code;

	LoginResponseBody({
	  required this.message,
	  required this.data,
	  required this.status,
	  required this.code,
	});

	factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
			_$LoginResponseBodyFromJson(json);
	Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}



@JsonSerializable()

class Data {
  Data({
    required this.token,
    required this.userName,
  });

  final String token;

 @JsonKey(name: 'username')
  final String userName;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);  
  
}
	