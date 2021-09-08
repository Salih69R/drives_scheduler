import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

part 'car_doc.g.dart';

@JsonSerializable()
class CarDoc {
  //the Id isn't needed, it's the id of the car holding this doc
//         public int Id { get; set; }

  @JsonKey(name: 'Code')
  late String Code;
  @JsonKey(name: 'DocName')
  late String DocName;
  @JsonKey(name: 'DocTitle')
  late String DocTitle;
  @JsonKey(name: 'DocPathName')
  late String DocPathName;

  CarDoc(
      {required this.Code,
      required this.DocName,
      required this.DocPathName,
      required this.DocTitle});

  factory CarDoc.fromJson(Map<String, dynamic> json) => _$CarDocFromJson(json);
  Map<String, dynamic> toJson() => _$CarDocToJson(this);
}
