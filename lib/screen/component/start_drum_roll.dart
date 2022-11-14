import 'package:calendar_app/calendar_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartDrumRoll extends HookConsumerWidget {
  final String tittle;
  final DateTime initialDateTime;
  final DateTime selectData;

  StartDrumRoll({
    required this.tittle,
    required this.initialDateTime,
    required this.selectData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarAction = ref.read(calenderViewModelProvider.notifier);
    final calendarState = ref.watch(calenderViewModelProvider);
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.white,
      child: _DatePickerItem(
        children: <Widget>[
          Text(tittle),
          CupertinoButton(
            onPressed: () =>
                ref.watch(calenderViewModelProvider.notifier).showDialog(
                      context: context,
                      child: CupertinoDatePicker(
                        initialDateTime: initialDateTime,
                        use24hFormat: true,
                        // ユーザーが dateTime を変更したときに呼び出されます。
                        onDateTimeChanged: (DateTime newDateTime) {
                          calendarAction.newStartTime(newDateTime);
                        },
                      ),
                    ),
            //終日スイッチがtrueかfalseかで変わる
            child: calendarState.allDay != true
                ? Text(
                    '${selectData.year}-${selectData.month}-${selectData.day} ${calendarState.startTime.hour}:${calendarState.startTime.minute}',
                    style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  )
                : Text(
                    '${selectData.year}-${selectData.month}-${selectData.day} ',
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
