import 'package:json_annotation/json_annotation.dart';

part 'app_notification.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class AppNotification {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'created_date')
  String? createdDate;
  @JsonKey(name: 'due_date')
  String? dueDate;
  @JsonKey(name: 'priority')
  int? priority;
  @JsonKey(name: 'read')
  bool? read;

  AppNotification(
      {this.id,
      this.type,
      this.message,
      this.createdDate,
      this.dueDate,
      this.priority,
      this.read});

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);
}
