import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? message;
  bool? status;
  int? code;
  Data? data;

  // json['data'] is Map<String, dynamic>
  //         ? Data.fromJson(
  //           json['data'] as Map<String, dynamic>,
  //         )
  //         : null;

  ApiErrorModel({
    this.message,
    this.status,
    this.code,
    this.data,
  });

  factory ApiErrorModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ApiErrorModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ApiErrorModelToJson(this);

  String getAllMessages() {
    List messages = ['hi'];

    if (data == null ||
        ((data!.email == null || data!.email!.isEmpty) &&
            (data!.phone == null ||
                data!.phone!.isEmpty))) {
      return message.toString();
    } else {
      messages.addAll(data!.email!);
      messages.addAll(data!.phone!);
      return messages.join('\n').toString();
    }
  }
}

@JsonSerializable()
class Data {
  List<String>? email;
  List<String>? phone;

  Data({this.email, this.phone});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
