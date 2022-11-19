import 'package:calendar_app/calendar_view_model.dart';
import 'package:calendar_app/screen/add_screen/add_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartDrumRoll extends HookConsumerWidget {
  final String tittle;
  final DateTime initialDateTime;
  final DateTime initialTime;
  final DateTime selectData;

  StartDrumRoll({
    required this.tittle,
    required this.initialDateTime,
    required this.initialTime,
    required this.selectData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addAction = ref.watch(addViewModelProvider.notifier);
    final addState = ref.watch(addViewModelProvider);
    final falseText = TextEditingController(
        text:
            '${addState.startDateTime.year}-${addState.startDateTime.month}-${addState.startDateTime.day} ${addState.startTime.hour}:${addState.startTime.minute}');
    final trueText = TextEditingController(
      text:
          '${addState.startDateTime.year}-${addState.startDateTime.month}-${addState.startDateTime.day} ',
    );
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.white,
      child: _DatePickerItem(
        children: <Widget>[
          Text(tittle),
          CupertinoButton(
              onPressed: () {
                addState.allDay != true
                    ? ref.read(calenderViewModelProvider.notifier).showDialog(
                          context: context,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                flex: 7,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: initialDateTime,
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
                                  initialDateTime: initialTime,
                                  use24hFormat: true,
                                  // ユーザーが dateTime を変更したときに呼び出されます。
                                  onDateTimeChanged: (DateTime newDateTime) {
                                    addAction.newStartTime(newDateTime);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                    : ref.read(calenderViewModelProvider.notifier).showDialog(
                          context: context,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: initialDateTime,
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
                          controller: falseText,
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
                  // ? Text(
                  //     '${addState.startDateTime.year}-${addState.startDateTime.month}-${addState.startDateTime.day} ${addState.startTime.hour}:${addState.startTime.minute}',
                  //     style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  //   )
                  : SizedBox(
                      width: 180,
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: trueText,
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
