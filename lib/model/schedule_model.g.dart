// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleModel _$$_ScheduleModelFromJson(Map<String, dynamic> json) =>
    _$_ScheduleModel(
      tittle: json['tittle'] as String,
      body: json['body'] as String,
      startDateTime: DateTime.parse(json['startDateTime'] as String),
      endDateTime: DateTime.parse(json['endDateTime'] as String),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      allDay: json['allDay'] as bool,
    );

Map<String, dynamic> _$$_ScheduleModelToJson(_$_ScheduleModel instance) =>
    <String, dynamic>{
      'tittle': instance.tittle,
      'body': instance.body,
      'startDateTime': instance.startDateTime.toIso8601String(),
      'endDateTime': instance.endDateTime.toIso8601String(),
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'allDay': instance.allDay,
    };
