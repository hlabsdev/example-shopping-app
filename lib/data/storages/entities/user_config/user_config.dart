import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_config.g.dart';

@JsonSerializable()
class UserConfig extends Equatable {
  final String? profile;
  final String? lang;
  final bool? online;
  final bool? darkMode;

  // final User? user;

  const UserConfig({
    this.profile,
    this.lang,
    this.online,
    this.darkMode,
    // this.user,
  });

  factory UserConfig.fromJson(Map<String, dynamic> json) {
    return _$UserConfigFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserConfigToJson(this);

  UserConfig copyWith({
    String? profile,
    String? lang,
    bool? online,
    bool? darkMode,
    // User? user,
  }) {
    return UserConfig(
      profile: profile ?? this.profile,
      lang: lang ?? this.lang,
      online: online ?? this.online,
      darkMode: darkMode ?? this.darkMode,
      // user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        profile,
        lang,
        online,
        darkMode /*, user*/
      ];
}
