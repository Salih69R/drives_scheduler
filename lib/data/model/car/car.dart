import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Car {
  @JsonKey(name: 'Id')
  int Id;
  @JsonKey(name: 'VehCode')
  String VehCode;
  @JsonKey(name: 'VehNumber')
  String VehNumber;
  @JsonKey(name: 'ActivatDate')
  String? ActivatDate;
  @JsonKey(name: 'AdminDate')
  String? AdminDate;
  @JsonKey(name: 'BrakesDate')
  String? BrakesDate;
  @JsonKey(name: 'VLockCode')
  String? VLockCode;
  @JsonKey(name: 'Kilometer')
  String? Kilometer;
  @JsonKey(name: 'Treatment')
  String? Treatment;
  @JsonKey(name: 'VKiloMtr')
  String? VKiloMtr;
  @JsonKey(name: 'KilmtrTimng')
  String? KilmtrTimng;
  @JsonKey(name: 'VTestDate')
  String? VTestDate;
  @JsonKey(name: 'VInsuDate')
  String? VInsuDate;
  @JsonKey(name: 'VStatus')
  String? VStatus;
  @JsonKey(name: 'DrvCode')
  String? DrvCode;
  @JsonKey(name: 'WinterDate')
  String? WinterDate;

  Car(
      {required this.ActivatDate,
      required this.AdminDate,
      required this.BrakesDate,
      required this.DrvCode,
      required this.Id,
      required this.KilmtrTimng,
      required this.Kilometer,
      required this.Treatment,
      required this.VInsuDate,
      required this.VKiloMtr,
      required this.VLockCode,
      required this.VStatus,
      required this.VTestDate,
      required this.VehCode,
      required this.VehNumber,
      required this.WinterDate});

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  Map<String, dynamic> toJson() => _$CarToJson(this);

//unused?
//         public string VehText1 { get; set; }
//         public string VehText2 { get; set; }
//         public string VehText3 { get; set; }
//         public string VehText4 { get; set; }
//         public string VehText5 { get; set; }
//         public string VehText6 { get; set; }

}

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    Id: json['Id'] as int,
    VehCode: json['VehCode'] as String,
    VehNumber: json['VehNumber'] as String,
    ActivatDate: json['ActivatDate'] as String?,
    AdminDate: json['AdminDate'] as String?,
    BrakesDate: json['BrakesDate'] as String?,
    DrvCode: json['DrvCode'] as String?,
    KilmtrTimng: json['KilmtrTimng'] as String?,
    Kilometer: json['Kilometer'] as String?,
    Treatment: json['Treatment'] as String?,
    VInsuDate: json['VInsuDate'] as String?,
    VKiloMtr: json['VKiloMtr'] as String?,
    VLockCode: json['VLockCode'] as String?,
    VStatus: json['VStatus'] as String?,
    VTestDate: json['VTestDate'] as String?,
    WinterDate: json['WinterDate'] as String?,
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
      'DrvCode': instance.DrvCode,
      'WinterDate': instance.WinterDate,
    };
