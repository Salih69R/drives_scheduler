// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDoc _$CarDocFromJson(Map<String, dynamic> json) {
  return CarDoc(
    Code: json['Code'] as String,
    DocName: json['DocName'] as String,
    DocPathName: json['DocPathName'] as String,
    DocTitle: json['DocTitle'] as String,
  );
}

Map<String, dynamic> _$CarDocToJson(CarDoc instance) => <String, dynamic>{
      'Code': instance.Code,
      'DocName': instance.DocName,
      'DocTitle': instance.DocTitle,
      'DocPathName': instance.DocPathName,
    };
