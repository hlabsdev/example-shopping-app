// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponse _$ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponse(
      status: json['status'] as String?,
      productDetail: json['product_detail'] == null
          ? null
          : ProductDetail.fromJson(
              json['product_detail'] as Map<String, dynamic>),
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductDetailResponseToJson(
        ProductDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'product_detail': instance.productDetail,
      'code': instance.code,
      'message': instance.message,
    };
