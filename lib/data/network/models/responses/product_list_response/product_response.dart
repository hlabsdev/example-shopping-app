import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends Equatable {
  final int? id;
  @JsonKey(name: 'article_name')
  final String? articleName;
  @JsonKey(name: 'shop_id')
  final String? shopId;
  final String? weight;
  @JsonKey(name: 'in_stock')
  final String? inStock;
  @JsonKey(name: 'min_command')
  final String? minCommand;
  final String? description;
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @JsonKey(name: 'mark_id')
  final String? markId;
  final String? price;
  @JsonKey(name: 'in_promotion')
  final String? inPromotion;
  @JsonKey(name: 'promo_discount')
  final String? promoDiscount;
  @JsonKey(name: 'currency_id')
  final String? currencyId;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final String? confirmed;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final Category? category;

  const ProductResponse({
    this.id,
    this.articleName,
    this.shopId,
    this.weight,
    this.inStock,
    this.minCommand,
    this.description,
    this.categoryId,
    this.markId,
    this.price,
    this.inPromotion,
    this.promoDiscount,
    this.currencyId,
    this.imageUrl,
    this.confirmed,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  ProductResponse copyWith({
    int? id,
    String? articleName,
    String? shopId,
    String? weight,
    String? inStock,
    String? minCommand,
    String? description,
    String? categoryId,
    String? markId,
    String? price,
    String? inPromotion,
    String? promoDiscount,
    String? currencyId,
    String? imageUrl,
    String? confirmed,
    String? createdAt,
    String? updatedAt,
    Category? category,
  }) {
    return ProductResponse(
      id: id ?? this.id,
      articleName: articleName ?? this.articleName,
      shopId: shopId ?? this.shopId,
      weight: weight ?? this.weight,
      inStock: inStock ?? this.inStock,
      minCommand: minCommand ?? this.minCommand,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      markId: markId ?? this.markId,
      price: price ?? this.price,
      inPromotion: inPromotion ?? this.inPromotion,
      promoDiscount: promoDiscount ?? this.promoDiscount,
      currencyId: currencyId ?? this.currencyId,
      imageUrl: imageUrl ?? this.imageUrl,
      confirmed: confirmed ?? this.confirmed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      articleName,
      shopId,
      weight,
      inStock,
      minCommand,
      description,
      categoryId,
      markId,
      price,
      inPromotion,
      promoDiscount,
      currencyId,
      imageUrl,
      confirmed,
      createdAt,
      updatedAt,
      category,
    ];
  }
}
