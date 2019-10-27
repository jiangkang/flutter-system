import 'package:flutter_system/date/lunar_solar_converter.dart';

class TimeUtils {
  /// 2019年10月
  static String getTodayYearAndMonthString() {
    final today = DateTime.now();
    return "${today.year}年${today.month}月";
  }

  /// 获取农历年份
  static int getLunarYear(DateTime time) =>
      _getLunarFromSolarTime(time).lunarYear;

  /// 获取农历月份
  static String getLunarMonth(DateTime time) =>
      _getLunarFromSolarTime(time).lunarMonthString;

  /// 获取农历天数
  static String getLunarDay(DateTime time) =>
      _getLunarFromSolarTime(time).lunarDayString;

  static Lunar _getLunarFromSolarTime(DateTime time) {
    final solar =
        Solar(solarYear: time.year, solarMonth: time.month, solarDay: time.day);
    return LunarSolarConverter.solarToLunar(solar);
  }
}
