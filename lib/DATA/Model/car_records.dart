import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';
import 'car.dart';
import 'car_doc.dart';

part 'car_records.g.dart';

@JsonSerializable()
class CarRecords {
  @JsonKey(name: 'Vehicle')
  Car car;

  @JsonKey(name: 'mLVehDocs')
  List<CarDoc> records;

  CarRecords({
    required this.car,
    required this.records,
  });

  factory CarRecords.fromJson(Map<String, dynamic> json) =>
      _$CarRecordsFromJson(json);
  Map<String, dynamic> toJson() => _$CarRecordsToJson(this);
}
