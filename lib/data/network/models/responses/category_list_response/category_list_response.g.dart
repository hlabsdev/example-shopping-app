// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponse _$CategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryListResponse(
      status: json['status'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'categories': instance.categories,
      'code': instance.code,
      'message': instance.message,
    };
