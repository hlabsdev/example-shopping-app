import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends Equatable {
  final String? token;
  final User? user;

  const UserData({this.token, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return _$UserDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  UserData copyWith({
    String? token,
    User? user,
  }) {
    return UserData(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, user];
}
