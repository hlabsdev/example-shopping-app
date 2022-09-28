// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail(
      id: json['id'] as int?,
      articleName: json['article_name'] as String?,
      shopId: json['shop_id'] as String?,
      weight: json['weight'] as String?,
      inStock: json['in_stock'] as String?,
      minCommand: json['min_command'] as String?,
      description: json['description'] as String?,
      categoryId: json['category_id'] as String?,
      markId: json['mark_id'] as String?,
      price: json['price'] as String?,
      inPromotion: json['in_promotion'] as String?,
      promoDiscount: json['promo_discount'] as String?,
      currencyId: json['currency_id'] as String?,
      imageUrl: json['image_url'] as String?,
      confirmed: json['confirmed'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_name': instance.articleName,
      'shop_id': instance.shopId,
      'weight': instance.weight,
      'in_stock': instance.inStock,
      'min_command': instance.minCommand,
      'description': instance.description,
      'category_id': instance.categoryId,
      'mark_id': instance.markId,
      'price': instance.price,
      'in_promotion': instance.inPromotion,
      'promo_discount': instance.promoDiscount,
      'currency_id': instance.currencyId,
      'image_url': instance.imageUrl,
      'confirmed': instance.confirmed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'shop': instance.shop,
      'category': instance.category,
    };
