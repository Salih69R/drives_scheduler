// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    ActivatDate: json['ActivatDate'] as String,
    AdminDate: json['AdminDate'] as String,
    BrakesDate: json['BrakesDate'] as String,
    Deleted: json['Deleted'] as String,
    DrvCode: json['DrvCode'] as String,
    Id: json['Id'] as int,
    KilmtrTimng: json['KilmtrTimng'] as String,
    Kilometer: json['Kilometer'] as String,
    Treatment: json['Treatment'] as String,
    VInsuDate: json['VInsuDate'] as String,
    VKiloMtr: json['VKiloMtr'] as String,
    VLockCode: json['VLockCode'] as String,
    VStatus: json['VStatus'] as String,
    VTestDate: json['VTestDate'] as String,
    VehCode: json['VehCode'] as String,
    VehNumber: json['VehNumber'] as String,
    WinterDate: json['WinterDate'] as String,
  );
}

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'Id': instance.Id,
      'ActivatDate': instance.ActivatDate,
      'AdminDate': instance.AdminDate,
      'BrakesDate': instance.BrakesDate,
      'VehCode': instance.VehCode,
      'VehNumber': instance.VehNumber,
      'VLockCode': instance.VLockCode,
      'Kilometer': instance.Kilometer,
      'Treatment': instance.Treatment,
      'VKiloMtr': instance.VKiloMtr,
      'KilmtrTimng': instance.KilmtrTimng,
      'VTestDate': instance.VTestDate,
      'VInsuDate': instance.VInsuDate,
      'VStatus': instance.VStatus,
      'Deleted': instance.Deleted,
      'DrvCode': instance.DrvCode,
      'WinterDate': instance.WinterDate,
    };
