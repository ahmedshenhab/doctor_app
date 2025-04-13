import 'package:json_annotation/json_annotation.dart';

part 'speciality_response_model.g.dart';

@JsonSerializable()
class SpecialityResponseModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  SpecialityResponseModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SpecialityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialityResponseModelFromJson(json);



}


@JsonSerializable()
class Data {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')
  List<Doctors>? doctorsList;

  Data({this.id, this.name, this.doctorsList});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    
}
@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });
   factory Doctors.fromJson(Map<String,dynamic>json)=>_$DoctorsFromJson(json);
}
@JsonSerializable()
class Specialization {
  int? id;
  String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

 
}
@JsonSerializable()
class City {
  int? id;
  String? name;
  Specialization? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  
  
}
