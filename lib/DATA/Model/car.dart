import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

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
