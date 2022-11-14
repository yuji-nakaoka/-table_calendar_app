import 'package:calendar_app/screen/add_screen.dart';
import 'package:calendar_app/screen/calendar_view_model.dart';
import 'package:calendar_app/screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAlertDialog extends HookConsumerWidget {
  final String dayTittle;
  final DateTime dateTime;

  CustomAlertDialog({
    required this.dayTittle,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarAction = ref.read(calenderViewModelProvider.notifier);
    return AlertDialog(
      insetPadding: EdgeInsets.all(8),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dayTittle),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddScreen(
                                selectData: dateTime,
                              )),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ))
            ],
          ),
          Divider(
            height: 0,
            thickness: 0.1,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
        ],
      ),
      content: Container(
        width: 300,
        height: 400,
        child: calendarAction.getEventForDay(dateTime).length != 0
            ? ListView.builder(
                itemCount: calendarAction.getEventForDay(dateTime).length,
                itemBuilder: (context, index) {
                  final eventkey = calendarAction.getEventForDay(dateTime);
                  return Column(
                    children: [
                      ListTile(
                        leading: Text('終日'),
                        title: Text(
                          eventkey[index],
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditScreen(
                                      selectData: dateTime,
                                      tittle: eventkey[index],
                                    )),
                          );
                        },
                      ),
                      Divider(
                        height: 0,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              )
            : Center(
                child: Text(
                  '予定がありません',
                ),
              ),
      ),
    );
  }
}
