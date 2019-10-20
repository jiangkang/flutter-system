class TimeUtils {
  /// 2019年10月
  static String getTodayYearAndMonthString() {
    final today = DateTime.now();
    return "${today.year}年${today.month}月";
  }
}
