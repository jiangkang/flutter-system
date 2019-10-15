import 'package:flutter/material.dart';

/// whether start with monday or sunday in a week
enum StartDayOfWeek { monday, sunday }

enum CalendarLanguage { chinese, english }

const weekDaysStartWithMonday = ["一", "二", "三", "四", "五", "六", "日"];

const weekDaysStartWithSunday = ["日", "一", "二", "三", "四", "五", "六"];

const weekDaysStartWithMondayEnglish = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun"
];

const weekDaysStartWithSundayEnglish = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat"
];

/// Calendar View
class Calendar extends StatefulWidget {
  final StartDayOfWeek startDayOfWeek;
  final CalendarLanguage calendarLanguage;
  final DateTime startSelectionDay;
  final DateTime endSelectionDay;
  final TextStyle weekTextStyle;

  const Calendar(
      {Key key,
      this.startDayOfWeek = StartDayOfWeek.sunday,
      this.calendarLanguage = CalendarLanguage.chinese,
      this.startSelectionDay,
      this.endSelectionDay,
      this.weekTextStyle = const TextStyle(fontSize: 21)})
      : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedYearAndMonth;

  StartDayOfWeek _startDayOfWeek;

  CalendarLanguage _calendarLanguage;

  DateTime _startSelectionDay;

  DateTime _endSelectionDay;

  @override
  void initState() {
    _selectedYearAndMonth = DateTime.now();
    _startDayOfWeek = widget.startDayOfWeek;
    _calendarLanguage = widget.calendarLanguage;
    _startDayOfWeek = widget.startDayOfWeek;
    _endSelectionDay = widget.endSelectionDay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // select year or month
    final header = _buildHeader();
    final week = _buildWeek();
    final days = _buildDays();
    final body = Table(
      children: [week]..addAll(days),
    );
    return Column(
      children: <Widget>[header, body],
    );
  }

  Row _buildHeader() {
    final header = Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.chevron_left), onPressed: _selectPreMonth),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("${_selectedYearAndMonth.year} /",
                  style: TextStyle(fontSize: 21)),
              Text(" ${_selectedYearAndMonth.month}",
                  style: TextStyle(fontSize: 21))
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.chevron_right), onPressed: _selectNextMonth),
      ],
    );
    return header;
  }

  _selectPreMonth() {
    setState(() {
      if (_selectedYearAndMonth.month == 1) {
        _selectedYearAndMonth = DateTime(_selectedYearAndMonth.year - 1, 12);
      } else {
        _selectedYearAndMonth = DateTime(
            _selectedYearAndMonth.year, _selectedYearAndMonth.month - 1, 12);
      }
    });
  }

  _selectNextMonth() {
    setState(() {
      if (_selectedYearAndMonth.month == 12) {
        _selectedYearAndMonth = DateTime(_selectedYearAndMonth.year + 1, 1, 12);
      } else {
        _selectedYearAndMonth = DateTime(
            _selectedYearAndMonth.year, _selectedYearAndMonth.month + 1, 12);
      }
    });
  }

  TableRow _buildWeek() {
    final weekNames = _getWeekNames();
    final week = weekNames.take(7).map((date) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: Color(0xFFE6E6E6)))),
        child: Center(
          child: Text(
            date,
            style: widget.weekTextStyle,
          ),
        ),
      );
    }).toList();
    return TableRow(children: week);
  }

  List<TableRow> _buildDays() {
    final result = <TableRow>[];
    final daysInMonth = getDaysInMonth(_selectedYearAndMonth, _startDayOfWeek);
    int i = 0;
    while (i < daysInMonth.length) {
      result.add(_buildTableRow(daysInMonth.skip(i).take(7).toList()));
      i += 7;
    }
    return result;
  }

  TableRow _buildTableRow(List<DateTime> list) {
    return TableRow(
        children: list.map((date) {
      return DayCell(
        dateTime: date,
        currentMonth: _selectedYearAndMonth,
      );
    }).toList());
  }

  List<String> _getWeekNames() {
    switch (_calendarLanguage) {
      case CalendarLanguage.chinese:
        if (_startDayOfWeek == StartDayOfWeek.sunday) {
          return weekDaysStartWithSunday;
        } else {
          return weekDaysStartWithMonday;
        }
        break;
      case CalendarLanguage.english:
        if (_startDayOfWeek == StartDayOfWeek.sunday) {
          return weekDaysStartWithSundayEnglish;
        } else {
          return weekDaysStartWithMondayEnglish;
        }
        break;
    }
    return [];
  }
}

class DayCell extends StatefulWidget {
  final DateTime dateTime;

  final DateTime currentMonth;

  const DayCell({Key key, this.dateTime, this.currentMonth}) : super(key: key);

  @override
  _DayCellState createState() => _DayCellState();
}

class _DayCellState extends State<DayCell> {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isToday = widget.dateTime.day == today.day &&
        widget.dateTime.month == today.month &&
        widget.dateTime.year == today.year;
    final isCurrentMonth = widget.currentMonth.month == widget.dateTime.month;
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor:
                  isToday ? Theme.of(context).primaryColorDark : Colors.white10,
              child: Center(
                child: Text(
                  widget.dateTime.day.toString(),
                  style: TextStyle(
                      color: isCurrentMonth
                          ? Theme.of(context).textTheme.body1.color
                          : Colors.grey,
                      fontSize: 21),
                ),
              ),
            ),
          ),
        ));
  }
}

/// get the day list of the month
List<DateTime> getDaysInMonth(DateTime date, StartDayOfWeek startDayOfWeek) {
  final firstDayInMonth = DateTime.utc(date.year, date.month, 1, 12);
  // 上个月的天数
  final daysBefore = startDayOfWeek == StartDayOfWeek.sunday
      ? firstDayInMonth.weekday % 7
      : firstDayInMonth.weekday - 1;
  final firstDisplayInTable =
      firstDayInMonth.subtract(Duration(days: daysBefore));

  // 算出下个月的第一天，减去一天即当月最后一天
  final lastDayInMonth = date.month < 12
      ? DateTime.utc(date.year, date.month + 1, 1, 12)
          .subtract(Duration(days: 1))
      : DateTime.utc(date.year + 1, 1, 1, 12).subtract(Duration(days: 1));
  final daysAfter = startDayOfWeek == StartDayOfWeek.sunday
      ? (lastDayInMonth.weekday == 7 ? 6 : (6 - lastDayInMonth.weekday))
      : (7 - lastDayInMonth.weekday);
  final lastDisplayInMonth = lastDayInMonth.add(Duration(days: daysAfter));
  return _daysInRange(firstDisplayInTable, lastDisplayInMonth).toList();
}

Iterable<DateTime> _daysInRange(DateTime firstDay, DateTime lastDay) sync* {
  var temp = firstDay;

  final last = lastDay.add(Duration(days: 1));

  while (temp.isBefore(last)) {
    yield DateTime.utc(temp.year, temp.month, temp.day, 12);
    temp = temp.add(const Duration(days: 1));
  }
}
