import 'package:calendar_app/model/schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

final editViewModelProvider =
    Provider<StateNotifierProvider<EditViewModel, ScheduleModel>>(
        (ref) => throw UnimplementedError());

final editViewModelFamily =
    StateNotifierProvider.family<EditViewModel, ScheduleModel, ScheduleModel>(
        (ref, editViewModel) => EditViewModel(
              fetchAllDay: editViewModel.allDay,
              fetchEndDateTime: editViewModel.endDateTime,
              fetchEndTime: editViewModel.endTime,
              fetchStartDateTime: editViewModel.startDateTime,
              fetchStartTime: editViewModel.startTime,
            ));

class EditViewModel extends StateNotifier<ScheduleModel> {
  EditViewModel({
    required bool fetchAllDay,
    required DateTime fetchStartDateTime,
    required DateTime fetchEndDateTime,
    required DateTime fetchStartTime,
    required DateTime fetchEndTime,
  }) : super(ScheduleModel(
            allDay: fetchAllDay,
            startDateTime: fetchStartDateTime,
            endDateTime: fetchEndDateTime,
            startTime: fetchStartTime,
            endTime: fetchEndTime));

  //ここで値を変える関数を書く
  //終日スイッチが押された時にtrue,falseの変更
  void changeAllDay(bool onChanged) {
    state = state.copyWith(allDay: onChanged);
  }

  //開始のドラムロールの値が変わった時の関数(年、月、日)
  void newStartDate(DateTime dt) {
    state = state.copyWith(
      startDateTime: dt,
    );
  }

//開始のドラムロールの値が変わった時の関数(時間)
  void newStartTime(DateTime dt) {
    state = state.copyWith(
      startTime: dt,
    );
  }

  //終了のドラムロールの値が変わった時の関数(年、月、日)
  void newEndDate(DateTime dt) {
    state = state.copyWith(
      endDateTime: dt,
    );
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

final isButtonRequestingProvider = StateProvider.autoDispose((ref) => true);
