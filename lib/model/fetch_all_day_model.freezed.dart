// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_all_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchAllDayModel _$FetchAllDayModelFromJson(Map<String, dynamic> json) {
  return _FetchAllDayModel.fromJson(json);
}

/// @nodoc
mixin _$FetchAllDayModel {
  bool get fetchAllDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchAllDayModelCopyWith<FetchAllDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchAllDayModelCopyWith<$Res> {
  factory $FetchAllDayModelCopyWith(
          FetchAllDayModel value, $Res Function(FetchAllDayModel) then) =
      _$FetchAllDayModelCopyWithImpl<$Res, FetchAllDayModel>;
  @useResult
  $Res call({bool fetchAllDay});
}

/// @nodoc
class _$FetchAllDayModelCopyWithImpl<$Res, $Val extends FetchAllDayModel>
    implements $FetchAllDayModelCopyWith<$Res> {
  _$FetchAllDayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchAllDay = null,
  }) {
    return _then(_value.copyWith(
      fetchAllDay: null == fetchAllDay
          ? _value.fetchAllDay
          : fetchAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchAllDayModelCopyWith<$Res>
    implements $FetchAllDayModelCopyWith<$Res> {
  factory _$$_FetchAllDayModelCopyWith(
          _$_FetchAllDayModel value, $Res Function(_$_FetchAllDayModel) then) =
      __$$_FetchAllDayModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool fetchAllDay});
}

/// @nodoc
class __$$_FetchAllDayModelCopyWithImpl<$Res>
    extends _$FetchAllDayModelCopyWithImpl<$Res, _$_FetchAllDayModel>
    implements _$$_FetchAllDayModelCopyWith<$Res> {
  __$$_FetchAllDayModelCopyWithImpl(
      _$_FetchAllDayModel _value, $Res Function(_$_FetchAllDayModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchAllDay = null,
  }) {
    return _then(_$_FetchAllDayModel(
      fetchAllDay: null == fetchAllDay
          ? _value.fetchAllDay
          : fetchAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchAllDayModel
    with DiagnosticableTreeMixin
    implements _FetchAllDayModel {
  const _$_FetchAllDayModel({required this.fetchAllDay});

  factory _$_FetchAllDayModel.fromJson(Map<String, dynamic> json) =>
      _$$_FetchAllDayModelFromJson(json);

  @override
  final bool fetchAllDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchAllDayModel(fetchAllDay: $fetchAllDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FetchAllDayModel'))
      ..add(DiagnosticsProperty('fetchAllDay', fetchAllDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAllDayModel &&
            (identical(other.fetchAllDay, fetchAllDay) ||
                other.fetchAllDay == fetchAllDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fetchAllDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAllDayModelCopyWith<_$_FetchAllDayModel> get copyWith =>
      __$$_FetchAllDayModelCopyWithImpl<_$_FetchAllDayModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchAllDayModelToJson(
      this,
    );
  }
}

abstract class _FetchAllDayModel implements FetchAllDayModel {
  const factory _FetchAllDayModel({required final bool fetchAllDay}) =
      _$_FetchAllDayModel;

  factory _FetchAllDayModel.fromJson(Map<String, dynamic> json) =
      _$_FetchAllDayModel.fromJson;

  @override
  bool get fetchAllDay;
  @override
  @JsonKey(ignore: true)
  _$$_FetchAllDayModelCopyWith<_$_FetchAllDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}
