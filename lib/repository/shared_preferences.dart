import 'dart:collection';
import 'dart:convert';

import 'package:calendar_app/model/schedule_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

final sharedPreferencesProvider = StateNotifierProvider.autoDispose<
        SharedPreferencesRepository, AsyncValue<Map<DateTime, dynamic>>>(
    ((ref) => SharedPreferencesRepository()));

//仮データ使う際は、eventに代入
Map<DateTime, List<ScheduleModel>> events = {
  DateTime.now(): [
    ScheduleModel(
      tittle: 'イベント',
      body: '初イベント',
      startDateTime: DateTime.now(),
      endDateTime: DateTime.now(),
      startTime: DateTime.utc(0, 0, 0, 0, 0),
      endTime: DateTime.utc(0, 0, 0, 1, 0),
      allDay: true,
    )
  ]
};

final outputFormat = DateFormat('yyyy-MM-dd');

typedef EventLoader = List<dynamic> Function(DateTime day);

// DateTime型から20210930の8桁のint型へ変換
int _getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

//新しく作ったmap
Map<DateTime, dynamic> newEvents = {};
//ScheduleModelを入れるリスト
var scheduleList = <ScheduleModel>[];

final event = LinkedHashMap<DateTime, dynamic>(
  equals: isSameDay,
  hashCode: _getHashCode,
)..addAll(newEvents);

class SharedPreferencesRepository
    extends StateNotifier<AsyncValue<Map<DateTime, dynamic>>> {
  SharedPreferencesRepository() : super(AsyncValue.loading()) {
    fetchSchedule();
  }

//保存データの取得
  Future<void> fetchSchedule() async {
    final prefs = await SharedPreferences.getInstance();

    Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
      Map<DateTime, dynamic> newMap = {};
      map.forEach((key, value) {
        newMap[DateTime.parse(key)] = map[key];
      });
      return newMap;
    }

    newEvents = Map<DateTime, dynamic>.from(
      decodeMap(
        json.decode(prefs.getString('events') ?? "{}"),
      ),
    );

    state = AsyncValue.data(newEvents);
  }

//日程のリスト
  List getEventForDay(DateTime day) {
    return newEvents[day] ?? [];
  }

//日程の取得
  EventLoader getLoader() {
    return (DateTime day) {
      //eventの中のday(dateTime)と紐づいているvalueを取り出している
      //keyがない日にちはnullを返して空を返す
      return newEvents[day] ?? [];
    };
  }

//予定の追加
  Future<void> addSchedule({
    required DateTime dateTime,
    required String tittle,
    required String body,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required DateTime startTime,
    required DateTime endTime,
    required bool allDay,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final data = ScheduleModel(
        tittle: tittle,
        body: body,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        startTime: startTime,
        endTime: endTime,
        allDay: allDay);

    //これでMap<dateTime,[scheduleList]>がつくられる
    scheduleList.add(data);
    //[key]=valueで保存
    newEvents[dateTime] = scheduleList;

//これはstringに変換する関数
    Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
      Map<String, dynamic> newMap = {};
      map.forEach((key, value) {
        newMap[key.toString()] = map[key];
      });
      return newMap;
    }

    String encoded = json.encode(encodeMap(newEvents));
    await prefs.setString('events', encoded);
  }

//予定の削除
  Future<void> removeSchedule() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('events');
  }
}
