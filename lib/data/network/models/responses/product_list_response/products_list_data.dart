import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'link.dart';
import 'product_response.dart';

part 'products_list_data.g.dart';

@JsonSerializable()
class ProductsListData extends Equatable {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final List<ProductResponse>? products;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  final List<Link>? links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const ProductsListData({
    this.currentPage,
    this.products,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ProductsListData.fromJson(Map<String, dynamic> json) =>
      _$ProductsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListDataToJson(this);

  ProductsListData copyWith({
    int? currentPage,
    List<ProductResponse>? products,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return ProductsListData(
      currentPage: currentPage ?? this.currentPage,
      products: products ?? this.products,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currentPage,
      products,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
