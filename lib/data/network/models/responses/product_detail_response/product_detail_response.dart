import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product_detail.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse extends Equatable {
  final String? status;
  @JsonKey(name: 'product_detail')
  final ProductDetail? productDetail;
  final int? code;
  final String? message;

  const ProductDetailResponse({
    this.status,
    this.productDetail,
    this.code,
    this.message,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);

  ProductDetailResponse copyWith({
    String? status,
    ProductDetail? productDetail,
    int? code,
    String? message,
  }) {
    return ProductDetailResponse(
      status: status ?? this.status,
      productDetail: productDetail ?? this.productDetail,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, productDetail, code, message];
}
