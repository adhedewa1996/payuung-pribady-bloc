import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerUpdateState> {
  DatePickerCubit() : super(DatePickerUpdateState());

  Future<void> init() async {
    await initializeDateFormatting('id');

    final now = DateTime.now();
    final formatter = DateFormat(DateFormat.MONTH, 'id');

    emit(
      DatePickerUpdateState(
        datePickerData: DatePickerData().copyWith(
          selectedYear: now.year.toString(),
          selectedMonth: formatter.format(now),
          selectedDay: DateTime.now(),
          kFirstDay: DateTime(1900),
          kLastDay: DateTime(now.year, 12, 31),
          showArrow: true,
          monthList: getMonthsInYear('id'),
          yearList: getYearList(),
        ),
      ),
    );
  }

  List<String> getMonthsInYear(String localeName) {
    final data = <String>[];
    var date = DateTime(2000, 1, 1, 1);
    final formatter = DateFormat(DateFormat.MONTH, localeName);

    // for (var i = 0; i < (now.year == int.parse(selectedYear!) ? now.month : 12); i++) {
    for (var i = 0; i < 12; i++) {
      data.add(formatter.format(date));
      date = DateTime(date.year, date.month + 1);
    }
    return data;
  }

  List<String> getYearList() {
    final now = DateTime.now();
    final formatter = DateFormat(DateFormat.MONTH, 'id');
    final data = <String>[];
    final monthList = getMonthsInYear('id');
    // debugPrint(monthList.indexOf(selectedMonth!).toString());
    for (var i = 1900; i <= (monthList.indexOf(formatter.format(now)) + 1 > now.month ? now.year - 1 : now.year); i++) {
      data.add(i.toString());
    }

    return data;
  }

  String getWeekday(int weekday, String localeName) {
    return weekDays(localeName)[weekday];
  }

  List<String> weekDays(String localeName) {
    final formatter = DateFormat(DateFormat.ABBR_WEEKDAY, localeName);
    return [DateTime(2000, 1, 3), DateTime(2000, 1, 4), DateTime(2000, 1, 5), DateTime(2000, 1, 6), DateTime(2000, 1, 7), DateTime(2000, 1, 8), DateTime(2000, 1, 9)]
        .map((day) => formatter.format(day))
        .toList();
  }

  void setSelectedYear(String year) {
    state.datePickerData?.selectedYear = year;
    getMonthsInYear('id');
    setFocusDate(DateTime(int.parse(year), getMonthsInYear('id').indexOf(state.datePickerData?.selectedMonth ?? '') + 1));
  }

  void setSelectedMonth(String month) {
    state.datePickerData?.selectedMonth = month;
    // dont refresh year list
    // yearList = <String>[];
    // getYearList();

    setFocusDate(DateTime(int.parse(state.datePickerData?.selectedYear ?? '1990'), getMonthsInYear('id').indexOf(month) + 1));
    // setFocusDate(DateTime(2023, 12));
  }

  void setFocusDate(DateTime date) {
    emit(
      DatePickerUpdateState(
        datePickerData: state.datePickerData?.copyWith(focusedDay: date),
      ),
    );
  }

  void previousMonth(String month) {
    if (month.toLowerCase() == 'januari') {
      final value = getYearList().indexOf(state.datePickerData?.selectedYear ?? '1990');
      setSelectedYear(getYearList()[value - 1]);
      setSelectedMonth(getMonthsInYear('id')[11]);
    } else {
      final value = getMonthsInYear('id').indexOf(month);
      setSelectedMonth(getMonthsInYear('id')[value - 1]);
    }
  }

  void nextMonth(String month) {
    if (month.toLowerCase() == 'desember') {
      final value = getYearList().indexOf(state.datePickerData?.selectedYear ?? '1990');
      setSelectedYear(getYearList()[value + 1]);
      setSelectedMonth(getMonthsInYear('id')[0]);
    } else {
      final value = getMonthsInYear('id').indexOf(month);
      setSelectedMonth(getMonthsInYear('id')[value + 1]);
    }
  }

  void setIsSelectedDay({
    required bool status,
    required DateTime selectedDay,
    required DateTime focusedDay,
  }) {
    emit(
      DatePickerUpdateState(
        datePickerData: state.datePickerData?.copyWith(
          isSelectedDay: status,
          selectedDay: selectedDay,
          focusedDay: focusedDay,
        ),
      ),
    );
  }

  void onFormatChanged(CalendarFormat format) {
    emit(
      DatePickerUpdateState(
        datePickerData: state.datePickerData?.copyWith(
          calendarFormat: format,
        ),
      ),
    );
  }

  void onPageChanged({
    required DateTime focusedDay,
  }) {
    setFocusDate(focusedDay);
    setSelectedMonth(state.datePickerData?.monthList?[focusedDay.month - 1] ?? '');
    setSelectedYear(state.datePickerData?.focusedDay?.year.toString() ?? '');
  }
}
