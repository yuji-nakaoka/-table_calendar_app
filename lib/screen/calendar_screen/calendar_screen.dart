import 'package:calendar_app/screen/calendar_screen/calendar_view_model.dart';
import 'package:calendar_app/repository/shared_preferences.dart';
import 'package:calendar_app/screen/add_screen/add_view_model.dart';
import 'package:calendar_app/screen/component/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カレンダー'),
      ),
      body: Calendar(),
    );
  }
}

class Calendar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(sharedPreferencesProvider);
    final eventAction = ref.watch(sharedPreferencesProvider.notifier);
    final now = DateTime.now();
    final outputFormat = DateFormat('yyyy-MM-dd');
    //final  date = outputFormat.format(now);　...サンプル書き方
    //dateTimeから曜日を取る時に使う
    final dateFormatForDayOfWeek = DateFormat.E('ja');
    final calendarState = ref.watch(calenderViewModelProvider);
    final calendarAction = ref.read(calenderViewModelProvider.notifier);
    final addAction = ref.read(addViewModelProvider.notifier);

//選んだ日の前日と後日
    final tomorrow = calendarState.selectDay.add(Duration(days: 1));
    final yesterday = calendarState.selectDay.subtract(Duration(days: 1));

//dateTimeから曜日を取得
    final formatStrForDayOfWeek =
        dateFormatForDayOfWeek.format(calendarState.selectDay);
    final formatStrForDayOfWeekYesterday =
        dateFormatForDayOfWeek.format(yesterday);
    final formatStrForDayOfWeekTomorrow =
        dateFormatForDayOfWeek.format(tomorrow);
    print(tomorrow);
    print(eventState);

    //Visibleのオンオフ
    final isVisible = ref.watch(isVisibleRequestingProvider.state);
    return eventState.when(
        data: (event) => Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8, top: 8, left: 8),
                          child: ElevatedButton(
                            child: const Text('今日'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              calendarAction.newSelectDay(now);
                            },
                          ),
                        ),
                      ],
                    ),
                    TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      firstDay: DateTime.utc(now.year - 100, 1, 1),
                      lastDay: DateTime.utc(now.year + 100, 12, 31),
                      focusedDay: calendarState.foucusDay,
                      locale: 'ja_JP',
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      selectedDayPredicate: (day) {
                        //isSameDayは2つの引数(DateTime)を取り、2つの日付が同じか否かを判定します。
                        return isSameDay(calendarState.selectDay, day);
                      },
                      //、isSameDayがtrueを返せば、フォーカスが更新されます。
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(calendarState.selectDay, selectedDay)) {
                          calendarAction.newSelectDay(selectedDay);
                          //ドラムロールの値（scheduleState）を選んだ日にちと時間に変更
                          addAction.newStartDate(selectedDay);
                          addAction.newStartTime(now);
                          addAction.newEndDate(selectedDay);
                          //終了はプラス1時間している
                          addAction.newEndTime(now.add(Duration(hours: 1)));
                          //DetialScreenの切り替え
                          isVisible.state = true;
                        } else {
                          //DetialScreenの切り替え
                          isVisible.state = true;
                        }
                      },
                      //イベントはMap形式で保持します。Mapオブジェクトのkeyは(DateTime, UTC)、valueは(List<String>) です。
                      eventLoader: eventAction.getLoader(),
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (_, day) {
                          //曜日の色変更
                          if (day.weekday == DateTime.sunday) {
                            return Center(
                              child: Text(
                                '日',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 13),
                              ),
                            );
                          }
                          if (day.weekday == DateTime.saturday) {
                            return Center(
                              child: Text(
                                '土',
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 13),
                              ),
                            );
                          }
                          //曜日のフォントサイズの変更
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.zero,
                            alignment: Alignment.topCenter,
                            child: Text(
                              dateFormatForDayOfWeek.format(day),
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 13),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isVisible.state,
                  child: DetialScreen(
                      outputFormat: outputFormat,
                      yesterday: yesterday,
                      formatStrForDayOfWeek: formatStrForDayOfWeek,
                      selectedDay: calendarState.selectDay,
                      tomorrow: tomorrow),
                ),
              ],
            ),
        error: (error, _) => const Text('取得できませんでした'),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

//コンポーネント　詳細画面のポップアップ
  Future<dynamic> detialDialog(
      BuildContext context,
      DateFormat outputFormat,
      DateTime yesterday,
      String formatStrForDayOfWeek,
      DateTime selectedDay,
      DateTime tomorrow) {
    return showDialog(
      context: context,
      builder: (_) {
        return DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: TabBarView(
            children: [
              CustomAlertDialog(
                dayTittle: outputFormat.format(yesterday).toString() +
                    '($formatStrForDayOfWeek)',
                dateTime: yesterday,
              ),
              CustomAlertDialog(
                dayTittle: outputFormat.format(selectedDay).toString() +
                    '($formatStrForDayOfWeek)',
                dateTime: selectedDay,
              ),
              CustomAlertDialog(
                dayTittle: outputFormat.format(tomorrow).toString() +
                    '($formatStrForDayOfWeek)',
                dateTime: tomorrow,
              )
            ],
          ),
        );
      },
    );
  }
}

//カレンダー詳細ページ
class DetialScreen extends HookConsumerWidget {
  final DateFormat outputFormat;
  final DateTime yesterday;
  final String formatStrForDayOfWeek;
  final DateTime selectedDay;
  final DateTime tomorrow;

  DetialScreen(
      {Key? key,
      required this.outputFormat,
      required this.yesterday,
      required this.formatStrForDayOfWeek,
      required this.selectedDay,
      required this.tomorrow})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(isVisibleRequestingProvider.state);
    return Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: GestureDetector(
            onTap: () {
              isVisible.state = false;
            },
            child: AbsorbPointer(
              child: ModalBarrier(
                color: Colors.grey.withOpacity(1),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 400,
            height: 500,
            child: DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: TabBarView(
                children: [
                  CustomAlertDialog(
                    dayTittle: outputFormat.format(yesterday).toString() +
                        '($formatStrForDayOfWeek)',
                    dateTime: yesterday,
                  ),
                  CustomAlertDialog(
                    dayTittle: outputFormat.format(selectedDay).toString() +
                        '($formatStrForDayOfWeek)',
                    dateTime: selectedDay,
                  ),
                  CustomAlertDialog(
                    dayTittle: outputFormat.format(tomorrow).toString() +
                        '($formatStrForDayOfWeek)',
                    dateTime: tomorrow,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
