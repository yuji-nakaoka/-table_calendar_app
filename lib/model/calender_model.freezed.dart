// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calender_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalenderModel {
  DateTime get selectDay => throw _privateConstructorUsedError;
  DateTime get foucusDay => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  List<ScheduleModel>? get schedulesInMonth =>
      throw _privateConstructorUsedError;
  bool get allDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderModelCopyWith<CalenderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderModelCopyWith<$Res> {
  factory $CalenderModelCopyWith(
          CalenderModel value, $Res Function(CalenderModel) then) =
      _$CalenderModelCopyWithImpl<$Res, CalenderModel>;
  @useResult
  $Res call(
      {DateTime selectDay,
      DateTime foucusDay,
      DateTime startTime,
      DateTime endTime,
      List<ScheduleModel>? schedulesInMonth,
      bool allDay});
}

/// @nodoc
class _$CalenderModelCopyWithImpl<$Res, $Val extends CalenderModel>
    implements $CalenderModelCopyWith<$Res> {
  _$CalenderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectDay = null,
    Object? foucusDay = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? schedulesInMonth = freezed,
    Object? allDay = null,
  }) {
    return _then(_value.copyWith(
      selectDay: null == selectDay
          ? _value.selectDay
          : selectDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      foucusDay: null == foucusDay
          ? _value.foucusDay
          : foucusDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      schedulesInMonth: freezed == schedulesInMonth
          ? _value.schedulesInMonth
          : schedulesInMonth // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalenderModelCopyWith<$Res>
    implements $CalenderModelCopyWith<$Res> {
  factory _$$_CalenderModelCopyWith(
          _$_CalenderModel value, $Res Function(_$_CalenderModel) then) =
      __$$_CalenderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectDay,
      DateTime foucusDay,
      DateTime startTime,
      DateTime endTime,
      List<ScheduleModel>? schedulesInMonth,
      bool allDay});
}

/// @nodoc
class __$$_CalenderModelCopyWithImpl<$Res>
    extends _$CalenderModelCopyWithImpl<$Res, _$_CalenderModel>
    implements _$$_CalenderModelCopyWith<$Res> {
  __$$_CalenderModelCopyWithImpl(
      _$_CalenderModel _value, $Res Function(_$_CalenderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectDay = null,
    Object? foucusDay = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? schedulesInMonth = freezed,
    Object? allDay = null,
  }) {
    return _then(_$_CalenderModel(
      selectDay: null == selectDay
          ? _value.selectDay
          : selectDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      foucusDay: null == foucusDay
          ? _value.foucusDay
          : foucusDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      schedulesInMonth: freezed == schedulesInMonth
          ? _value._schedulesInMonth
          : schedulesInMonth // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CalenderModel with DiagnosticableTreeMixin implements _CalenderModel {
  const _$_CalenderModel(
      {required this.selectDay,
      required this.foucusDay,
      required this.startTime,
      required this.endTime,
      final List<ScheduleModel>? schedulesInMonth,
      this.allDay = false})
      : _schedulesInMonth = schedulesInMonth;

  @override
  final DateTime selectDay;
  @override
  final DateTime foucusDay;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  final List<ScheduleModel>? _schedulesInMonth;
  @override
  List<ScheduleModel>? get schedulesInMonth {
    final value = _schedulesInMonth;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool allDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalenderModel(selectDay: $selectDay, foucusDay: $foucusDay, startTime: $startTime, endTime: $endTime, schedulesInMonth: $schedulesInMonth, allDay: $allDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalenderModel'))
      ..add(DiagnosticsProperty('selectDay', selectDay))
      ..add(DiagnosticsProperty('foucusDay', foucusDay))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('schedulesInMonth', schedulesInMonth))
      ..add(DiagnosticsProperty('allDay', allDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalenderModel &&
            (identical(other.selectDay, selectDay) ||
                other.selectDay == selectDay) &&
            (identical(other.foucusDay, foucusDay) ||
                other.foucusDay == foucusDay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._schedulesInMonth, _schedulesInMonth) &&
            (identical(other.allDay, allDay) || other.allDay == allDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectDay, foucusDay, startTime,
      endTime, const DeepCollectionEquality().hash(_schedulesInMonth), allDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalenderModelCopyWith<_$_CalenderModel> get copyWith =>
      __$$_CalenderModelCopyWithImpl<_$_CalenderModel>(this, _$identity);
}

abstract class _CalenderModel implements CalenderModel {
  const factory _CalenderModel(
      {required final DateTime selectDay,
      required final DateTime foucusDay,
      required final DateTime startTime,
      required final DateTime endTime,
      final List<ScheduleModel>? schedulesInMonth,
      final bool allDay}) = _$_CalenderModel;

  @override
  DateTime get selectDay;
  @override
  DateTime get foucusDay;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  List<ScheduleModel>? get schedulesInMonth;
  @override
  bool get allDay;
  @override
  @JsonKey(ignore: true)
  _$$_CalenderModelCopyWith<_$_CalenderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
