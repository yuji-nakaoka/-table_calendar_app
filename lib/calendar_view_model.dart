import 'dart:collection';
import 'package:calendar_app/model/calender_model.dart';
import 'package:calendar_app/model/event_list.dart';
import 'package:calendar_app/model/schedule_model.dart';
import 'package:calendar_app/repository/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

final calenderViewModelProvider =
    StateNotifierProvider<CalenderViewModel, CalenderModel>(
  (ref) => CalenderViewModel(),
);

final refs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

typedef EventLoader = List<dynamic> Function(DateTime day);

// DateTime型から20210930の8桁のint型へ変換
int _getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// final events = LinkedHashMap<DateTime, List<ScheduleModel>>(
//   equals: isSameDay,
//   hashCode: _getHashCode,
// )..addAll(prefData);

class CalenderViewModel extends StateNotifier<CalenderModel> {
  CalenderViewModel()
      : super(CalenderModel(
          foucusDay: DateTime.now(),
          selectDay: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now(),
        ));

//カレンダーの日にちがタップされた時にselectDayの値を変更
  void newSelectDay(DateTime dt) {
    state = state.copyWith(selectDay: dt);
  }

//終日スイッチが押された時にtrue,falseの変更
  void changeAllDay(bool onChanged) {
    state = state.copyWith(allDay: onChanged);
  }

//開始のドラムロールの値が変わった時の関数
  void newStartTime(DateTime dt) {
    state = state.copyWith(startTime: dt);
  }

//終了のドラムロールの値が変わった時の関数
  void newEndTime(DateTime dt) {
    state = state.copyWith(endTime: dt);
  }

//ドラムロールを表示するときの関数
  void showDialog({required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // 下マージンは、ポップアップをシステムの上に揃えるため
              // ナビゲーションバー
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // ポップアップの背景色
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // SafeArea ウィジェットを使用して、システムのオーバーラップを回避
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  List getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  EventLoader getLoader() {
    return (DateTime day) {
      //eventの中のday(dateTime)と紐づいているvalueを取り出している
      //keyがない日にちはnullを返して空を返す
      return events[day] ?? [];
    };
  }
}
