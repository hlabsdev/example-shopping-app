// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      id: json['id'] as int?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      phone: json['phone'] as String?,
      isActivated: json['is_activated'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'location': instance.location,
      'lat': instance.lat,
      'long': instance.long,
      'phone': instance.phone,
      'is_activated': instance.isActivated,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
