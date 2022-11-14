import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calender_model.freezed.dart';

@freezed
class CalenderModel with _$CalenderModel {
  const factory CalenderModel({
    String? dropdownTittle,
    required DateTime selectDay,
    required DateTime foucusDay,
    required DateTime startTime,
    required DateTime endTime,
    @Default(false) bool allDay,
  }) = _CalenderModel;
}
