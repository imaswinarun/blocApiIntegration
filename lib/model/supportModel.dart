import 'package:json_annotation/json_annotation.dart';

part 'supportModel.g.dart';

@JsonSerializable()
class SupportModel {
  late String url;
  late String text;

  SupportModel(this.url, this.text);

  factory SupportModel.fromJson(Map<String, dynamic> data) =>
      _$SupportModelFromJson(data);

  Map<String, dynamic> toJson() => _$SupportModelToJson(this);
}
