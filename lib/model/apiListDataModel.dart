import 'package:json_annotation/json_annotation.dart';

part 'apiListDataModel.g.dart';

@JsonSerializable()
class ApiListDataModel {
  late int id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  ApiListDataModel(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory ApiListDataModel.fromJson(Map<String, dynamic> data) =>
      _$ApiListDataModelFromJson(data);

  Map<String, dynamic> toJson() => _$ApiListDataModelToJson(this);
}
