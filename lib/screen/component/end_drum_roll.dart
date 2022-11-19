import 'package:calendar_app/calendar_view_model.dart';
import 'package:calendar_app/screen/add_screen/add_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EndDrumRoll extends HookConsumerWidget {
  final String tittle;
  final DateTime initialDateTime;
  final DateTime initialTime;
  final DateTime selectData;

  EndDrumRoll({
    required this.tittle,
    required this.initialDateTime,
    required this.initialTime,
    required this.selectData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addAction = ref.watch(addViewModelProvider.notifier);
    final addState = ref.watch(addViewModelProvider);

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
                                  addAction.newEndDate(newDate);
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
                                  addAction.newEndTime(newDateTime);
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
                ? Text(
                    '${addState.endDateTime.year}-${addState.endDateTime.month}-${addState.endDateTime.day} ${addState.endTime.hour}:${addState.endTime.minute}',
                    style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  )
                : Text(
                    '${addState.endDateTime.year}-${addState.endDateTime.month}-${addState.endDateTime.day} ',
                    style: const TextStyle(fontSize: 20.0, color: Colors.black),
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
