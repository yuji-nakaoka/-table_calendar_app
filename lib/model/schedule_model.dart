import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'schedule_model.freezed.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    String? tittle,
    String? body,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required DateTime startTime,
    required DateTime endTime,
    @Default(false) bool allDay,
  }) = _ScheduleModel;

  factory ScheduleModel.initial() => ScheduleModel(
        tittle: '',
        body: '',
        startDateTime: DateTime.now(),
        endDateTime: DateTime.now(),
        startTime: DateTime.utc(0, 0, 0, 0, 0),
        endTime: DateTime.utc(0, 0, 0, 1, 0),
      );
}
