import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse extends Equatable {
  final String? status;
  final List<Category>? categories;
  final int? code;
  final String? message;

  const CategoryListResponse({
    this.status,
    this.categories,
    this.code,
    this.message,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);

  CategoryListResponse copyWith({
    String? status,
    List<Category>? categories,
    int? code,
    String? message,
  }) {
    return CategoryListResponse(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, categories, code, message];
}
