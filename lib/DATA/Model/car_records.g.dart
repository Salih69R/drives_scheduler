// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
