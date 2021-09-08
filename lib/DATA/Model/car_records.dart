import 'package:json_annotation/json_annotation.dart';
import 'car.dart';
import 'car_doc.dart';

part 'car_records.g.dart';

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
