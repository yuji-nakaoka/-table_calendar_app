import 'package:calendar_app/model/calender_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

final calenderViewModelProvider =
    StateNotifierProvider<CalenderViewModel, CalenderModel>(
  (ref) => CalenderViewModel(),
);

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
}
