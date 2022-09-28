// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      countryId: json['country_id'] as String?,
      roleId: json['role_id'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      isValid: json['is_valid'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'country_id': instance.countryId,
      'role_id': instance.roleId,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'is_valid': instance.isValid,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'role': instance.role,
    };
