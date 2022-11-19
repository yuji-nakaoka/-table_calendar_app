import 'dart:collection';
import 'dart:convert';

import 'package:calendar_app/model/schedule_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesRepository>(
    (ref) => SharedPreferencesRepository());

Map<DateTime, List<ScheduleModel>> events = {
  DateTime.now(): [
    ScheduleModel(
      tittle: 'イベント',
      body: '初イベント',
      startDateTime: DateTime.now(),
      endDateTime: DateTime.now(),
      startTime: DateTime.utc(0, 0, 0, 0, 0),
      endTime: DateTime.utc(0, 0, 0, 1, 0),
    )
  ]
};

// DateTime型から20210930の8桁のint型へ変換
int _getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// final events = LinkedHashMap<DateTime, List<ScheduleModel>>(
//   equals: isSameDay,
//   hashCode: _getHashCode,
// )..addAll(prefData);

class SharedPreferencesRepository
    extends StateNotifier<AsyncValue<Map<DateTime, List<ScheduleModel>>>> {
  SharedPreferencesRepository() : super(AsyncValue.loading()) {
    fetchSchedule();
  }

  Future<void> fetchSchedule() async {
    final prefs = await SharedPreferences.getInstance();

    Map<DateTime, ScheduleModel?> decodeMap(Map<String, ScheduleModel?> map) {
      Map<DateTime, ScheduleModel?> newMap = {};
      map.forEach((key, value) {
        newMap[DateTime.parse(key)] = map[key];
      });
      return newMap;
    }

    events = Map<DateTime, List<ScheduleModel>>.from(
        decodeMap(json.decode(prefs.getString("events") ?? "{}")));

    print(events);

    state = AsyncValue.data(events);
  }
}
