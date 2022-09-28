import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final String? status;
  final UserData? data;
  final int? code;
  final String? message;

  const LoginResponse({this.status, this.data, this.code, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResponse copyWith({
    String? status,
    UserData? data,
    int? code,
    String? message,
  }) {
    return LoginResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, data, code, message];
}
