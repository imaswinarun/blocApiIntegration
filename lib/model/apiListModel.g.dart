// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiListModel _$ApiListModelFromJson(Map<String, dynamic> json) => ApiListModel(
      json['page'] as int,
      json['per_page'] as int,
      json['total'] as int,
      json['total_pages'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => ApiListDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      SupportModel.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiListModelToJson(ApiListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.apiListDataModel.map((e) => e.toJson()).toList(),
      'support': instance.supportModel.toJson(),
    };
