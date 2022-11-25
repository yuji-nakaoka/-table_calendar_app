import 'package:calendar_app/model/fetch_all_day_model.dart';
import 'package:calendar_app/repository/shared_preferences.dart';
import 'package:calendar_app/screen/add_screen/add_view_model.dart';
import 'package:calendar_app/screen/component/custom_cupertinoActionSheet.dart';
import 'package:calendar_app/screen/edit_screen/edit_view_model.dart';
import 'package:calendar_app/screen/fetch_data_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditScreen extends HookConsumerWidget {
  final DateTime selectData;
  final String tittle;
  final String body;
  final String startDateTime;
  final String endDateTime;
  final String startTime;
  final String endTime;
  final bool allDay;

  EditScreen({
    Key? key,
    required this.selectData,
    required this.tittle,
    required this.body,
    required this.startDateTime,
    required this.endDateTime,
    required this.startTime,
    required this.endTime,
    required this.allDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefAction = ref.watch(sharedPreferencesProvider.notifier);
    final editState = ref.watch(editViewModelProvider);
    final editAction = ref.watch(editViewModelProvider.notifier);
    final tittleController = TextEditingController(text: tittle);
    final bodyController = TextEditingController(text: body);
    //jsonでStringで受け取った値をDateTimeに変換
    final startDateTimeDt = DateTime.parse(startDateTime);
    final endDateTimeDt = DateTime.parse(endDateTime);
    final startTimeDt = DateTime.parse(startTime);
    final endTimeDt = DateTime.parse(endTime);

    //開始のテキスト
    final startFalseText = TextEditingController(
        text:
            '${startDateTimeDt.year}-${startDateTimeDt.month}-${startDateTimeDt.day} ${startTimeDt.hour}:${startTimeDt.minute}');
    final stareTrueText = TextEditingController(
        text:
            '${startDateTimeDt.year}-${startDateTimeDt.month}-${startDateTimeDt.day} ');
//終了のテキスト
    final endFalseText = TextEditingController(
        text:
            '${endDateTimeDt.year}-${endDateTimeDt.month}-${endDateTimeDt.day} ${endTimeDt.hour}:${endTimeDt.minute}');
    final endTrueText = TextEditingController(
      text:
          '${endDateTimeDt.year}-${endDateTimeDt.month}-${endDateTimeDt.day} ',
    );

    //保存ボタンのオンオフ
//tittleの入力
    final isFechTittle = ref.watch(isFetchTittleRequestingProvider.state);
    //   print(isTittle.state);
//bodyの入力
    final isbody = ref.watch(isFetchBodyRequestingProvider.state);
//    print(isbody.state);
//開始の入力
    final isStartDateTime = ref.watch(isStartDateTimeRequestingProvider.state);
    //   print(isStartDateTime.state);
//終了の入力
    final isEndDateTime = ref.watch(isEndDateTimeRequestingProvider.state);
    // print(isEndDateTime.state);
//終日の入力
    final isAllDayTime = ref.watch(isAllDayRequestingProvider.state);
    //  print(isAllDayTime);
    //スケジュール事のboolの値を管理

    return ProviderScope(
      overrides: [
        fetchDataViewModelProvider
            .overrideWith((ref) => fetchDataViewModelFamily(allDay)),
      ],
      child: Consumer(builder: (context, ref, _) {
        //スケジュール事のboolの値を管理
        final scheduleBool = ref.watch(fetchDataViewModelProvider);
        //familyのときはstateの取り方が違う
        final fetchAlldayData = ref.watch(fetchDataViewModelFamily(allDay));
        final boolAction = ref.watch(scheduleBool.notifier);
        return Scaffold(
          backgroundColor: Color.fromARGB(237, 243, 243, 243),
          appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  tittleController.text == tittle
                      ? Navigator.of(context).popUntil((route) => route.isFirst)
                      : showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCupertinoActionSheet();
                          },
                        );
                },
                icon: Icon(Icons.close),
              ),
              title: Text('予定の編集'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 70,
                    child: Consumer(builder: (context, ref, _) {
                      return ElevatedButton(
                        onPressed: isFechTittle.state &&
                                isbody.state &&
                                isStartDateTime.state &&
                                isEndDateTime.state
                            ? null
                            : () {
                                print('sharedpreferencesは保存の編集ができない');
                              },
                        child: Text('保存'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey, //ボタンの背景色
                        ),
                      );
                    }),
                  ),
                )
              ]),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: tittleController,
                    decoration: InputDecoration(
                      hintText: 'タイトルを入力してください',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onTap: () {
                      isFechTittle.state == false;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                ),
                child: Container(
                  color: Colors.white,
                  child: SwitchListTile(
                    title: const Text(
                      '終日',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: fetchAlldayData.fetchAllDay,
                    onChanged: (bool newValue) {
                      boolAction.changeAllDay(newValue);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                ),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  color: Colors.white,
                  child: _DatePickerItem(
                    children: <Widget>[
                      Text('開始'),
                      CupertinoButton(
                        onPressed: () {
                          isStartDateTime.state = false;
                          fetchAlldayData.fetchAllDay != true
                              ? editAction.showDialog(
                                  context: context,
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Flexible(
                                        flex: 7,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          initialDateTime: DateTime.utc(
                                            selectData.year,
                                            selectData.month,
                                            selectData.day,
                                          ),
                                          use24hFormat: true,
                                          // ユーザーが dateTime を変更したときに呼び出されます。
                                          onDateTimeChanged:
                                              (DateTime newDate) {
                                            editAction.newStartDate(newDate);
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          minuteInterval: 15,
                                          initialDateTime:
                                              DateTime.utc(0, 0, 0, 0, 0),
                                          use24hFormat: true,
                                          // ユーザーが dateTime を変更したときに呼び出されます。
                                          onDateTimeChanged:
                                              (DateTime newDateTime) {
                                            editAction
                                                .newStartTime(newDateTime);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : editAction.showDialog(
                                  context: context,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.utc(
                                      selectData.year,
                                      selectData.month,
                                      selectData.day,
                                    ),
                                    use24hFormat: true,
                                    // ユーザーが dateTime を変更したときに呼び出されます。
                                    onDateTimeChanged: (DateTime newDate) {
                                      editAction.newStartDate(newDate);
                                    },
                                  ),
                                );
                        },
                        //終日スイッチがtrueかfalseかで変わる
                        child: fetchAlldayData.fetchAllDay != true
                            ? SizedBox(
                                width: 180,
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: startFalseText,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                        bottom: 11,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 180,
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: stareTrueText,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 11, left: 50),
                                    ),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                ),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  color: Colors.white,
                  child: _DatePickerItem(
                    children: <Widget>[
                      Text('終了'),
                      CupertinoButton(
                          onPressed: () {
                            isStartDateTime.state = false;
                            fetchAlldayData.fetchAllDay != true
                                ? editAction.showDialog(
                                    context: context,
                                    child: Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(
                                          flex: 7,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: DateTime.utc(
                                              selectData.year,
                                              selectData.month,
                                              selectData.day,
                                            ),
                                            use24hFormat: true,
                                            // ユーザーが dateTime を変更したときに呼び出されます。
                                            onDateTimeChanged:
                                                (DateTime newDate) {
                                              editAction.newEndDate(newDate);
                                            },
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.time,
                                            minuteInterval: 15,
                                            initialDateTime:
                                                DateTime.utc(0, 0, 0, 0, 0),
                                            use24hFormat: true,
                                            // ユーザーが dateTime を変更したときに呼び出されます。
                                            onDateTimeChanged:
                                                (DateTime newDateTime) {
                                              editAction
                                                  .newEndTime(newDateTime);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : editAction.showDialog(
                                    context: context,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: DateTime.utc(
                                        selectData.year,
                                        selectData.month,
                                        selectData.day,
                                      ),
                                      use24hFormat: true,
                                      // ユーザーが dateTime を変更したときに呼び出されます。
                                      onDateTimeChanged: (DateTime newDate) {
                                        editAction.newEndDate(newDate);
                                      },
                                    ),
                                  );
                          },
                          //終日スイッチがtrueかfalseかで変わる
                          child: fetchAlldayData.fetchAllDay != true
                              ? SizedBox(
                                  width: 180,
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: endFalseText,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          bottom: 11,
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 180,
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: endTrueText,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            bottom: 11, left: 50),
                                      ),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: bodyController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'コメントを入力してください',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onTap: () {
                      isbody.state = false;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                                  title: Text("予定の削除"),
                                  content: Text("本当にこの日の予定を削除しますか？"),
                                  actions: [
                                    CupertinoDialogAction(
                                        child: Text(
                                          'キャンセル',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                    CupertinoDialogAction(
                                      child: Text(
                                        '削除',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {
                                        prefAction.removeSchedule();
                                        ref.refresh(sharedPreferencesProvider);
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                        print('削除');
                                      },
                                    )
                                  ],
                                ));
                      },
                      child: Text(
                        'この予定を削除',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
