import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    required String tittle,
    required String body,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required DateTime startTime,
    required DateTime endTime,
    @Default(false) bool allDay,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  factory ScheduleModel.initial() => ScheduleModel(
        tittle: '',
        body: '',
        startDateTime: DateTime.now(),
        endDateTime: DateTime.now(),
        startTime: DateTime.utc(0, 0, 0, 0, 0),
        endTime: DateTime.utc(0, 0, 0, 1, 0),
      );
}
