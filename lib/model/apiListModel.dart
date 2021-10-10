import 'package:apiTask/model/apiListDataModel.dart';
import 'package:apiTask/model/supportModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apiListModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiListModel {
  late int page;
  late int perPage;
  late int total;
  late int totalPages;
  late List<ApiListDataModel> apiListDataModel;
  late SupportModel supportModel;

  ApiListModel(
      this.page, this.perPage, this.total, this.totalPages, this.apiListDataModel, this.supportModel);

  factory ApiListModel.fromJson(Map<String, dynamic> data) =>
      _$ApiListModelFromJson(data);

  Map<String, dynamic> toJson() => _$ApiListModelToJson(this);
}
