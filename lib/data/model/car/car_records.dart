import 'package:json_annotation/json_annotation.dart';
import 'car.dart';
import 'car_doc.dart';

@JsonSerializable()
class CarRecords {
  @JsonKey(name: 'mVehicle')
  Car car;

  @JsonKey(name: 'mLVehDocs')
  List<dynamic> records;

  CarRecords({
    required this.car,
    required this.records,
  });

  factory CarRecords.fromJson(Map<String, dynamic> json) =>
      _$CarRecordsFromJson(json);
  Map<String, dynamic> toJson() => _$CarRecordsToJson(this);
}

CarRecords _$CarRecordsFromJson(Map<String, dynamic> json) {
  return CarRecords(
    car: Car.fromJson(json['mVehicle'] as Map<String, dynamic>),
    records: json['mLVehDocs'],
  );
}

Map<String, dynamic> _$CarRecordsToJson(CarRecords instance) =>
    <String, dynamic>{
      'car': instance.car,
      'records': instance.records,
    };
