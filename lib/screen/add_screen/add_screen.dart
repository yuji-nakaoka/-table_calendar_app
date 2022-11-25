import 'package:calendar_app/repository/shared_preferences.dart';
import 'package:calendar_app/screen/add_screen/add_view_model.dart';
import 'package:calendar_app/screen/calendar_screen/calendar_view_model.dart';
import 'package:calendar_app/screen/component/custom_cupertinoActionSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddScreen extends ConsumerWidget {
  final DateTime selectData;
  AddScreen({
    required this.selectData,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefAction = ref.watch(sharedPreferencesProvider.notifier);
    final addState = ref.watch(addViewModelProvider);
    final addAction = ref.watch(addViewModelProvider.notifier);
    //開始のテキスト
    final startFalseText = TextEditingController(
        text:
            '${addState.startDateTime.year}-${addState.startDateTime.month}-${addState.startDateTime.day} ${addState.startTime.hour}:${addState.startTime.minute}');
    final stareTrueText = TextEditingController(
      text:
          '${addState.startDateTime.year}-${addState.startDateTime.month}-${addState.startDateTime.day} ',
    );
//終了のテキスト
    final endFalseText = TextEditingController(
        text:
            '${addState.endDateTime.year}-${addState.endDateTime.month}-${addState.endDateTime.day} ${addState.endTime.hour}:${addState.endTime.minute}');
    final endTrueText = TextEditingController(
      text:
          '${addState.endDateTime.year}-${addState.endDateTime.month}-${addState.endDateTime.day} ',
    );

//保存ボタンのオンオフ
//tittleの入力
    final tittle = ref.watch(tittleProvider.state);
    final isTittle = ref.watch(isTittleRequestingProvider.state);
    print(isTittle);
//bodyの入力
    final body = ref.watch(bodyProvider.state);
    final isbody = ref.watch(isBodyRequestingProvider.state);
    print(isbody);

    return Scaffold(
      backgroundColor: Color.fromARGB(237, 243, 243, 243),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              tittle.state.text == ''
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
          title: Text('予定の追加'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 70,
                child: ElevatedButton(
                  onPressed: isTittle.state || isbody.state
                      ? null
                      : () {
                          prefAction.addSchedule(
                              dateTime: addState.startDateTime,
                              tittle: tittle.state.text,
                              body: body.state.text,
                              startDateTime: addState.startDateTime,
                              endDateTime: addState.endDateTime,
                              startTime: addState.startTime,
                              endTime: addState.endTime,
                              allDay: addState.allDay);
                          ref.refresh(sharedPreferencesProvider);
                          ref.refresh(addViewModelProvider);
                          ref.refresh(isVisibleRequestingProvider.state);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          print('保存しました');
                        },
                  child: Text('保存'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, //ボタンの背景色
                  ),
                ),
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
                controller: tittle.state,
                decoration: InputDecoration(
                  hintText: 'タイトルを入力してください',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (data) {
                  if (tittle.state.text.isNotEmpty) {
                    isTittle.state = false;
                  } else {
                    isTittle.state = true;
                  }
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
                value: addState.allDay,
                onChanged: (bool newValue) {
                  addAction.changeAllDay(newValue);
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
                        addState.allDay != true
                            ? addAction.showDialog(
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
                                        onDateTimeChanged: (DateTime newDate) {
                                          addAction.newStartDate(newDate);
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
                                          addAction.newStartTime(newDateTime);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : addAction.showDialog(
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
                                    addAction.newStartDate(newDate);
                                  },
                                ),
                              );
                      },
                      //終日スイッチがtrueかfalseかで変わる
                      child: addState.allDay != true
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
                            )),
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
                        addState.allDay != true
                            ? addAction.showDialog(
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
                                        onDateTimeChanged: (DateTime newDate) {
                                          addAction.newEndDate(newDate);
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
                                          addAction.newEndTime(newDateTime);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : addAction.showDialog(
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
                                    addAction.newEndDate(newDate);
                                  },
                                ),
                              );
                      },
                      //終日スイッチがtrueかfalseかで変わる
                      child: addState.allDay != true
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
                                    contentPadding:
                                        EdgeInsets.only(bottom: 11, left: 50),
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
                controller: body.state,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'コメントを入力してください',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (data) {
                  if (body.state.text.isNotEmpty) {
                    isbody.state = false;
                  } else {
                    isbody.state = true;
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
