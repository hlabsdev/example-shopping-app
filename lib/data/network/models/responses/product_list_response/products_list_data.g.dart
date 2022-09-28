// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListData _$ProductsListDataFromJson(Map<String, dynamic> json) =>
    ProductsListData(
      currentPage: json['current_page'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ProductsListDataToJson(ProductsListData instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'products': instance.products,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
