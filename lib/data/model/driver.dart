class Driver {
  Driver({
    required this.Id,
    required this.Cel1,
    required this.Cel2,
    required this.DrvCode,
    required this.DrvDesc,
    required this.DrvFulNam,
    required this.LicnType,
    required this.LicnYear,
    required this.LincExpDt,
    required this.LinchNum,
    required this.Tel1,
    required this.Tel2,
  });
  int Id;
  String Cel1;
  String Cel2;
  String DrvCode;
  String DrvDesc;
  String DrvFulNam;
  String LinchNum;
  String LicnType;
  String LicnYear;
  String LincExpDt;
  String Tel1;
  String Tel2;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  Map<String, dynamic> toJson() => _$DriverToJson(this);

  Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
        'Id': instance.Id,
        'Cel1': instance.Cel1,
        'Cel2': instance.Cel2,
        'DrvCode': instance.DrvCode,
        'DrvDesc': instance.DrvDesc,
        'DrvFulNam': instance.DrvFulNam,
        'LinchNum': instance.LinchNum,
        'LicnType': instance.LicnType,
        'LicnYear': instance.LicnYear,
        'LincExpDt': instance.LincExpDt,
        'Tel1': instance.Tel1,
        'Tel2': instance.Tel2,
      };
}

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    Id: json['Id'] as int,
    Cel1: json['Cel1'] as String,
    Cel2: json['Cel2'] as String,
    DrvCode: json['DrvCode'] as String,
    DrvDesc: json['DrvDesc'] as String,
    DrvFulNam: json['DrvFulNam'] as String,
    LinchNum: json['LinchNum'] as String,
    LicnType: json['LicnType'] as String,
    LicnYear: json['LicnYear'] as String,
    LincExpDt: json['LincExpDt'] as String,
    Tel1: json['Tel1'] as String,
    Tel2: json['Tel2'] as String,
  );
}
