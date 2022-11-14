import 'package:calendar_app/calendar_view_model.dart';
import 'package:calendar_app/screen/component/custom_cupertinoActionSheet.dart';
import 'package:calendar_app/screen/component/end_drum_roll.dart';
import 'package:calendar_app/screen/component/start_drum_roll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddScreen extends HookConsumerWidget {
  final DateTime selectData;
  AddScreen({
    required this.selectData,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tittleController = TextEditingController(text: '');
    final bodyController = TextEditingController(text: '');
    final calendarState = ref.watch(calenderViewModelProvider);
    final calendarAction = ref.read(calenderViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 243, 243, 243),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              tittleController.text == ''
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
                  onPressed: () {},
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
                controller: tittleController,
                decoration: InputDecoration(
                  hintText: 'タイトルを入力してください',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
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
                value: calendarState.allDay,
                onChanged: (bool newValue) {
                  calendarAction.changeAllDay(newValue);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
            ),
            child: StartDrumRoll(
              tittle: '開始',
              selectData: selectData,
              initialDateTime: calendarState.startTime,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
            ),
            child: EndDrumRoll(
              tittle: '終了',
              selectData: selectData,
              initialDateTime: calendarState.endTime,
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
