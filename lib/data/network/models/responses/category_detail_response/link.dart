import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link extends Equatable {
  final dynamic url;
  final String? label;
  final bool? active;

  const Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);

  Link copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, label, active];
}
