import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'products_list_data.dart';

part 'product_list_response.g.dart';

@JsonSerializable()
class ProductListResponse extends Equatable {
  final String? status;
  final ProductsListData? data;
  final int? code;
  final String? message;

  const ProductListResponse({
    this.status,
    this.data,
    this.code,
    this.message,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);

  ProductListResponse copyWith({
    String? status,
    ProductsListData? data,
    int? code,
    String? message,
  }) {
    return ProductListResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, data, code, message];
}
