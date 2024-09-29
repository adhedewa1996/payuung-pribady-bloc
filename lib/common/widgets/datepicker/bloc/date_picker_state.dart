part of 'date_picker_cubit.dart';

abstract class DatePickerState {
  DatePickerState({
    this.datePickerData,
  });
  final DatePickerData? datePickerData;

  DatePickerState copyWith({
    DatePickerData? datePickerData,
  });
}

class DatePickerUpdateState extends DatePickerState {
  DatePickerUpdateState({
    this.datePickerData,
  }) : super(datePickerData: datePickerData);

  final DatePickerData? datePickerData;

  @override
  DatePickerUpdateState copyWith({DatePickerData? datePickerData}) {
    return DatePickerUpdateState(datePickerData: datePickerData);
  }
}

class DatePickerData {
  DatePickerData({
    this.focusedDay,
    this.calendarFormat,
    this.isSelectedDay,
    this.showArrow,
    this.selectedMonth,
    this.selectedYear,
    this.selectedDay,
    this.monthList,
    this.yearList,
    this.kFirstDay,
    this.kLastDay,
  });
  final kToday = DateTime.now();
  final minYear = 1900;
  final localeConst = 'id';
  DateTime? focusedDay = DateTime.now();
  CalendarFormat? calendarFormat = CalendarFormat.month;
  bool? isSelectedDay = false;
  bool? showArrow = false;
  String? selectedMonth;
  String? selectedYear;
  DateTime? selectedDay;
  List<String>? monthList = <String>[];
  List<String>? yearList = <String>[];
  DateTime? kFirstDay;
  DateTime? kLastDay;

  DatePickerData copyWith({
    DateTime? focusedDay,
    CalendarFormat? calendarFormat,
    bool? isSelectedDay,
    bool? showArrow,
    String? selectedMonth,
    String? selectedYear,
    DateTime? selectedDay,
    List<String>? monthList,
    List<String>? yearList,
    DateTime? kFirstDay,
    DateTime? kLastDay,
  }) {
    return DatePickerData(
      focusedDay: focusedDay ?? this.focusedDay,
      calendarFormat: calendarFormat ?? this.calendarFormat,
      isSelectedDay: isSelectedDay ?? this.isSelectedDay,
      showArrow: showArrow ?? this.showArrow,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedYear: selectedYear ?? this.selectedYear,
      selectedDay: selectedDay ?? this.selectedDay,
      monthList: monthList ?? this.monthList,
      yearList: yearList ?? this.yearList,
      kFirstDay: kFirstDay ?? this.kFirstDay,
      kLastDay: kLastDay ?? this.kLastDay,
    );
  }
}
