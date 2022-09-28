import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? phone;
  @JsonKey(name: 'country_id')
  final String? countryId;
  @JsonKey(name: 'role_id')
  final String? roleId;
  final String? email;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'is_valid')
  final String? isValid;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final Role? role;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.countryId,
    this.roleId,
    this.email,
    this.emailVerifiedAt,
    this.isValid,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? countryId,
    String? roleId,
    String? email,
    String? emailVerifiedAt,
    String? isValid,
    String? createdAt,
    String? updatedAt,
    Role? role,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      countryId: countryId ?? this.countryId,
      roleId: roleId ?? this.roleId,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      isValid: isValid ?? this.isValid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      role: role ?? this.role,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      phone,
      countryId,
      roleId,
      email,
      emailVerifiedAt,
      isValid,
      createdAt,
      updatedAt,
      role,
    ];
  }
}
