// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  String get tittle => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get endDateTime => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  bool get allDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call(
      {String tittle,
      String body,
      DateTime startDateTime,
      DateTime endDateTime,
      DateTime startTime,
      DateTime endTime,
      bool allDay});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tittle = null,
    Object? body = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? allDay = null,
  }) {
    return _then(_value.copyWith(
      tittle: null == tittle
          ? _value.tittle
          : tittle // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleModelCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$_ScheduleModelCopyWith(
          _$_ScheduleModel value, $Res Function(_$_ScheduleModel) then) =
      __$$_ScheduleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tittle,
      String body,
      DateTime startDateTime,
      DateTime endDateTime,
      DateTime startTime,
      DateTime endTime,
      bool allDay});
}

/// @nodoc
class __$$_ScheduleModelCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$_ScheduleModel>
    implements _$$_ScheduleModelCopyWith<$Res> {
  __$$_ScheduleModelCopyWithImpl(
      _$_ScheduleModel _value, $Res Function(_$_ScheduleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tittle = null,
    Object? body = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? allDay = null,
  }) {
    return _then(_$_ScheduleModel(
      tittle: null == tittle
          ? _value.tittle
          : tittle // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleModel with DiagnosticableTreeMixin implements _ScheduleModel {
  const _$_ScheduleModel(
      {required this.tittle,
      required this.body,
      required this.startDateTime,
      required this.endDateTime,
      required this.startTime,
      required this.endTime,
      required this.allDay});

  factory _$_ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleModelFromJson(json);

  @override
  final String tittle;
  @override
  final String body;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final bool allDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleModel(tittle: $tittle, body: $body, startDateTime: $startDateTime, endDateTime: $endDateTime, startTime: $startTime, endTime: $endTime, allDay: $allDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleModel'))
      ..add(DiagnosticsProperty('tittle', tittle))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('startDateTime', startDateTime))
      ..add(DiagnosticsProperty('endDateTime', endDateTime))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('allDay', allDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleModel &&
            (identical(other.tittle, tittle) || other.tittle == tittle) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.allDay, allDay) || other.allDay == allDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tittle, body, startDateTime,
      endDateTime, startTime, endTime, allDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleModelCopyWith<_$_ScheduleModel> get copyWith =>
      __$$_ScheduleModelCopyWithImpl<_$_ScheduleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleModelToJson(
      this,
    );
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel(
      {required final String tittle,
      required final String body,
      required final DateTime startDateTime,
      required final DateTime endDateTime,
      required final DateTime startTime,
      required final DateTime endTime,
      required final bool allDay}) = _$_ScheduleModel;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$_ScheduleModel.fromJson;

  @override
  String get tittle;
  @override
  String get body;
  @override
  DateTime get startDateTime;
  @override
  DateTime get endDateTime;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  bool get allDay;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleModelCopyWith<_$_ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
