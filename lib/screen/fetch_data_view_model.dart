import 'dart:convert';

import 'package:calendar_app/model/fetch_all_day_model.dart';
import 'package:calendar_app/repository/shared_preferences.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final fetchDataViewModelProvider =
    Provider<StateNotifierProvider<FetchDataViewModel, FetchAllDayModel>>(
        (ref) => throw UnimplementedError());

final fetchDataViewModelFamily =
    StateNotifierProvider.family<FetchDataViewModel, FetchAllDayModel, bool>(
        (ref, fetchAllDay) => FetchDataViewModel(fetchAllDay: fetchAllDay));

class FetchDataViewModel extends StateNotifier<FetchAllDayModel> {
  FetchDataViewModel({required bool fetchAllDay})
      : super(FetchAllDayModel(fetchAllDay: fetchAllDay));

  //ここで値を変える関数を書く
  //終日スイッチが押された時にtrue,falseの変更
  void changeAllDay(bool onChanged) {
    state = state.copyWith(fetchAllDay: onChanged);
  }
}
