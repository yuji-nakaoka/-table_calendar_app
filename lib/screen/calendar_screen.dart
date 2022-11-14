import 'package:calendar_app/screen/calendar_view_model.dart';
import 'package:calendar_app/screen/component/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final outputFormat = DateFormat('yyyy-MM-dd');
    //final  date = outputFormat.format(now);　...サンプル書き方
    //dateTimeから曜日を取る時に使う
    final dateFormatForDayOfWeek = DateFormat.E('ja');
    final calendarState = ref.watch(calenderViewModelProvider);
    final calendarAction = ref.read(calenderViewModelProvider.notifier);
    // var tittleMonth =
    //     "${calendarState.selectDay.year}年${calendarState.selectDay.month}月";
    // var subDateTime = calendarState.selectDay.subtract(Duration(days: 31));
    // var addDateTime = calendarState.selectDay.add(Duration(days: 31));

    // //月のリスト
    // final monthList = List.generate(
    //     12,
    //     (i) => DateTime.utc(calendarState.selectDay.year)
    //         .add(Duration(days: 31 * i)));
    // print(monthList);

    // final list = [
    //   "${subDateTime.year}年${subDateTime.month}月",
    //   "${calendarState.selectDay.year}年${calendarState.selectDay.month}月",
    //   "${addDateTime.year}年${addDateTime.month}月",
    // ];

    return Scaffold(
      appBar: AppBar(
        title: Text('カレンダー'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 60, bottom: 8, top: 8, left: 8),
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
                // DropdownButton(
                //   value: calendarState.dropdownTittle,
                //   icon: const Icon(Icons.arrow_drop_down),
                //   items: list.map((String list) {
                //     // =>はインデント崩れるからオススメしないよ
                //     // ,を入れた方が整形した時に見やすいよ
                //     return DropdownMenuItem(value: list, child: Text(list));
                //   }).toList(),
                //   onChanged: (String? value) {
                //     calendarAction.newDropdownTittle(value);
                //   },
                //   onTap: () {
                //     debugPrint('ドロップダウンメニューアイテムがタップされたよ！');
                //   },
                // ),
              ],
            ),
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              firstDay: DateTime.utc(now.year - 1, 1, 1),
              lastDay: DateTime.utc(now.year + 1, 12, 31),
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

//選んだ日の前日と後日
                  final tomorrow = selectedDay.add(Duration(days: 1));
                  final yesterday = selectedDay.subtract(Duration(days: 1));

//dateTimeから曜日を取得
                  final formatStrForDayOfWeek =
                      dateFormatForDayOfWeek.format(selectedDay);
                  final formatStrForDayOfWeekYesterday =
                      dateFormatForDayOfWeek.format(yesterday);
                  final formatStrForDayOfWeekTomorrow =
                      dateFormatForDayOfWeek.format(tomorrow);
//詳細画面のポップアップ
                  showDialog(
                    context: context,
                    builder: (_) {
                      return DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: TabBarView(
                          children: [
                            CustomAlertDialog(
                              dayTittle:
                                  outputFormat.format(yesterday).toString() +
                                      '($formatStrForDayOfWeek)',
                              dateTime: yesterday,
                            ),
                            CustomAlertDialog(
                              dayTittle:
                                  outputFormat.format(selectedDay).toString() +
                                      '($formatStrForDayOfWeek)',
                              dateTime: selectedDay,
                            ),
                            CustomAlertDialog(
                              dayTittle:
                                  outputFormat.format(tomorrow).toString() +
                                      '($formatStrForDayOfWeek)',
                              dateTime: tomorrow,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              //イベントはMap形式で保持します。Mapオブジェクトのkeyは(DateTime, UTC)、valueは(List<String>) です。
              eventLoader: calendarAction.getLoader(),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, day) {
                  //曜日の色変更
                  if (day.weekday == DateTime.sunday) {
                    return Center(
                      child: Text(
                        '日',
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    );
                  }
                  if (day.weekday == DateTime.saturday) {
                    return Center(
                      child: Text(
                        '土',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 13),
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
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
