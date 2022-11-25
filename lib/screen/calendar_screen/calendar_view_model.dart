import 'package:calendar_app/model/calender_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

//visible（detialScreen）のオンオフ
final isVisibleRequestingProvider = StateProvider.autoDispose((ref) => false);

final calenderViewModelProvider =
    StateNotifierProvider<CalenderViewModel, CalenderModel>(
  (ref) => CalenderViewModel(),
);

class CalenderViewModel extends StateNotifier<CalenderModel> {
  CalenderViewModel()
      : super(CalenderModel(
          foucusDay: DateTime.now(),
          selectDay: DateTime.now(),
        ));

//カレンダーの日にちがタップされた時にselectDayの値を変更
  void newSelectDay(DateTime dt) {
    state = state.copyWith(selectDay: dt);
  }
}
