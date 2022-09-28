import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_detail.dart';

part 'category_detail_response.g.dart';

@JsonSerializable()
class CategoryDetailResponse extends Equatable {
  final String? status;
  @JsonKey(name: 'category_detail')
  final CategoryDetail? data;
  final int? code;
  final dynamic message;

  const CategoryDetailResponse({
    this.status,
    this.data,
    this.code,
    this.message,
  });

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryDetailResponseToJson(this);

  CategoryDetailResponse copyWith({
    String? status,
    CategoryDetail? categoryDetail,
    int? code,
    dynamic message,
  }) {
    return CategoryDetailResponse(
      status: status ?? this.status,
      data: categoryDetail ?? this.data,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, data, code, message];
}
