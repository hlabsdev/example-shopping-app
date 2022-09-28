// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConfig _$UserConfigFromJson(Map<String, dynamic> json) => UserConfig(
      profile: json['profile'] as String?,
      lang: json['lang'] as String?,
      online: json['online'] as bool?,
      darkMode: json['darkMode'] as bool?,
    );

Map<String, dynamic> _$UserConfigToJson(UserConfig instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'lang': instance.lang,
      'online': instance.online,
      'darkMode': instance.darkMode,
    };
