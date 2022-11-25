import 'package:calendar_app/model/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fetch_all_day_model.freezed.dart';
part 'fetch_all_day_model.g.dart';

@freezed
abstract class FetchAllDayModel with _$FetchAllDayModel {
  const factory FetchAllDayModel({
    required bool fetchAllDay,
  }) = _FetchAllDayModel;

  factory FetchAllDayModel.fromJson(Map<String, dynamic> json) =>
      _$FetchAllDayModelFromJson(json);
}
