// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(
  Map<String, dynamic> json,
) => ApiErrorModel(
  message: json['message'] as String?,
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
  data:
      json['data'] is Map<String, dynamic>
          ? Data.fromJson(
            json['data'] as Map<String, dynamic>,
          )
          : null,
);

Map<String, dynamic> _$ApiErrorModelToJson(
  ApiErrorModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'code': instance.code,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  email:
      (json['email'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  phone:
      (json['phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };
