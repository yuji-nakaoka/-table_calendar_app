import 'package:calendar_app/model/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calender_model.freezed.dart';

@freezed
class CalenderModel with _$CalenderModel {
  const factory CalenderModel({
    required DateTime selectDay,
    required DateTime foucusDay,
    required DateTime startTime,
    required DateTime endTime,
    List<ScheduleModel>? schedulesInMonth,
    @Default(false) bool allDay,
  }) = _CalenderModel;
}
