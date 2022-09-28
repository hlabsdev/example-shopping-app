import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop extends Equatable {
  final int? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  final String? name;
  final String? location;
  final String? lat;
  final String? long;
  final String? phone;
  @JsonKey(name: 'is_activated')
  final String? isActivated;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Shop({
    this.id,
    this.userId,
    this.name,
    this.location,
    this.lat,
    this.long,
    this.phone,
    this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);

  Shop copyWith({
    int? id,
    String? userId,
    String? name,
    String? location,
    String? lat,
    String? long,
    String? phone,
    String? isActivated,
    String? createdAt,
    String? updatedAt,
  }) {
    return Shop(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      location: location ?? this.location,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      phone: phone ?? this.phone,
      isActivated: isActivated ?? this.isActivated,
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
      userId,
      name,
      location,
      lat,
      long,
      phone,
      isActivated,
      createdAt,
      updatedAt,
    ];
  }
}
