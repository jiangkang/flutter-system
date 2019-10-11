import 'package:flutter/material.dart';

/// whether start with monday or sunday in a week
enum StartDayOfWeek { monday, sunday }

const weekDaysStartWithMonday = ["一", "二", "三", "四", "五", "六", "日"];

const weekDaysStartWithSunday = ["日", "一", "二", "三", "四", "五", "六"];

/// Calendar View
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedYearAndMonth;

  StartDayOfWeek _startDayOfWeek;

  @override
  void initState() {
    _selectedYearAndMonth = DateTime.now();
    _startDayOfWeek = StartDayOfWeek.monday;
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
              Text("${_selectedYearAndMonth.year}年"),
              Text("${_selectedYearAndMonth.month}月")
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
    List<Widget> week;
    if (_startDayOfWeek == StartDayOfWeek.monday) {
      week = weekDaysStartWithMonday.take(7).map((date) {
        return Center(
          child: Text(
            date,
            style: TextStyle(
                color: (date == "六" || date == "日")
                    ? Theme.of(context).accentColor
                    : Theme.of(context).textTheme.body1.color),
          ),
        );
      }).toList();
    } else {
      week = weekDaysStartWithSunday.take(7).map((date) {
        return Center(
          child: Text(date),
        );
      }).toList();
    }
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
      );
    }).toList());
  }
}

class DayCell extends StatefulWidget {
  final DateTime dateTime;

  const DayCell({Key key, this.dateTime}) : super(key: key);

  @override
  _DayCellState createState() => _DayCellState();
}

class _DayCellState extends State<DayCell> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: SizedBox(
            height: 60,
            child: Center(
                child: Text(
              widget.dateTime.day.toString(),
              style: TextStyle(
                  color: (widget.dateTime.weekday == 6 ||
                          widget.dateTime.weekday == 7)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.body1.color),
            ))));
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
