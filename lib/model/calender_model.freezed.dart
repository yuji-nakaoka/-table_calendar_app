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
  String? get dropdownTittle => throw _privateConstructorUsedError;
  DateTime get selectDay => throw _privateConstructorUsedError;
  DateTime get foucusDay => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
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
      {String? dropdownTittle,
      DateTime selectDay,
      DateTime foucusDay,
      DateTime startTime,
      DateTime endTime,
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
    Object? dropdownTittle = freezed,
    Object? selectDay = null,
    Object? foucusDay = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? allDay = null,
  }) {
    return _then(_value.copyWith(
      dropdownTittle: freezed == dropdownTittle
          ? _value.dropdownTittle
          : dropdownTittle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String? dropdownTittle,
      DateTime selectDay,
      DateTime foucusDay,
      DateTime startTime,
      DateTime endTime,
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
    Object? dropdownTittle = freezed,
    Object? selectDay = null,
    Object? foucusDay = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? allDay = null,
  }) {
    return _then(_$_CalenderModel(
      dropdownTittle: freezed == dropdownTittle
          ? _value.dropdownTittle
          : dropdownTittle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {this.dropdownTittle,
      required this.selectDay,
      required this.foucusDay,
      required this.startTime,
      required this.endTime,
      this.allDay = false});

  @override
  final String? dropdownTittle;
  @override
  final DateTime selectDay;
  @override
  final DateTime foucusDay;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey()
  final bool allDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalenderModel(dropdownTittle: $dropdownTittle, selectDay: $selectDay, foucusDay: $foucusDay, startTime: $startTime, endTime: $endTime, allDay: $allDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalenderModel'))
      ..add(DiagnosticsProperty('dropdownTittle', dropdownTittle))
      ..add(DiagnosticsProperty('selectDay', selectDay))
      ..add(DiagnosticsProperty('foucusDay', foucusDay))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('allDay', allDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalenderModel &&
            (identical(other.dropdownTittle, dropdownTittle) ||
                other.dropdownTittle == dropdownTittle) &&
            (identical(other.selectDay, selectDay) ||
                other.selectDay == selectDay) &&
            (identical(other.foucusDay, foucusDay) ||
                other.foucusDay == foucusDay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.allDay, allDay) || other.allDay == allDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dropdownTittle, selectDay,
      foucusDay, startTime, endTime, allDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalenderModelCopyWith<_$_CalenderModel> get copyWith =>
      __$$_CalenderModelCopyWithImpl<_$_CalenderModel>(this, _$identity);
}

abstract class _CalenderModel implements CalenderModel {
  const factory _CalenderModel(
      {final String? dropdownTittle,
      required final DateTime selectDay,
      required final DateTime foucusDay,
      required final DateTime startTime,
      required final DateTime endTime,
      final bool allDay}) = _$_CalenderModel;

  @override
  String? get dropdownTittle;
  @override
  DateTime get selectDay;
  @override
  DateTime get foucusDay;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  bool get allDay;
  @override
  @JsonKey(ignore: true)
  _$$_CalenderModelCopyWith<_$_CalenderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
