part of lunar_solar_converter;

/// 阳历，即公历
class Solar {
  int? solarYear = -1;
  int? solarMonth;
  int? solarDay;


  Solar({this.solarYear, this.solarMonth, this.solarDay});


  get dateTime => DateTime(solarYear!, solarMonth!, solarDay!);

  @override
  toString() {
    String result = "";
    if (solarYear != null) {
      int? absYear = solarYear?.abs();
      String prefix = ((solarYear ?? -1) < 0 ? "公元前" : "公元");
      result += "$prefix$absYear年";
    }
    if (solarMonth != null) {
      if (solarMonth! < 1 || solarMonth! > 12) {
        return "非法日期";
      }
      result += "$solarMonth月";

      if (solarDay != null) {
        if (solarDay! < 1 || solarDay! > 31) {
          return "非法日期";
        }
        result += "$solarDay日";
      }
    }
    return result.isEmpty ? "非法日期" : result;
  }
}
