// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailResponse _$CategoryDetailResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailResponse(
      status: json['status'] as String?,
      data: json['category_detail'] == null
          ? null
          : CategoryDetail.fromJson(
              json['category_detail'] as Map<String, dynamic>),
      code: json['code'] as int?,
      message: json['message'],
    );

Map<String, dynamic> _$CategoryDetailResponseToJson(
        CategoryDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'category_detail': instance.data,
      'code': instance.code,
      'message': instance.message,
    };
