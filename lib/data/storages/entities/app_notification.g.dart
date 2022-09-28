// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification(
      id: json['id'] as int?,
      type: json['type'] as String?,
      message: json['message'] as String?,
      createdDate: json['created_date'] as String?,
      dueDate: json['due_date'] as String?,
      priority: json['priority'] as int?,
      read: json['read'] as bool?,
    );

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
      'created_date': instance.createdDate,
      'due_date': instance.dueDate,
      'priority': instance.priority,
      'read': instance.read,
    };
