import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role extends Equatable {
  final int? id;
  final String? label;
  final String? description;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Role({
    this.id,
    this.label,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  Role copyWith({
    int? id,
    String? label,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return Role(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      label,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
