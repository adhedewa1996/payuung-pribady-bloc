// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// class DatePickerController extends GetxController {
//   DatePickerController({
//     required this.selectedDay,
//   });
//   bool isSelectedDay = false;
//   bool showArrow = false;
//   String? selectedMonth;
//   String? selectedYear;
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   DateTime focusedDay = DateTime.now();
//   DateTime? selectedDay;
//   List<String> monthList = <String>[];
//   List<String> yearList = <String>[];
//   final kToday = DateTime.now();
//   final minYear = 1900;
//   final localeConst = 'id';
//   DateTime? kFirstDay;
//   DateTime? kLastDay;

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     kFirstDay = DateTime(minYear);
//     kLastDay = DateTime(kToday.year, 12, 31);
//     await initializeDateFormatting('id').then((_) {
//       initializeDateNow(localeConst);
//       getMonthsInYear(localeConst);
//       getYearList();
//       // if (selectedDay != null) {
//       //   // print('INI ISINYA GMN ${selectedDay!.month}');
//       //   setFocusDate(DateTime(int.parse(selectedDay!.year.toString()), selectedDay!.month));
//       // }
//       showArrow = true;
//       print(monthList);
//     });
//     setFocusDate(selectedDay != null ? DateTime(int.parse(selectedDay!.year.toString()), selectedDay!.month) : DateTime.now());
//   }

//   void setIsSelectedDay(bool status) {
//     isSelectedDay = status;
//     update();
//   }

//   List<String> weekDays(String localeName) {
//     final formatter = DateFormat(DateFormat.ABBR_WEEKDAY, localeName);
//     return [DateTime(2000, 1, 3), DateTime(2000, 1, 4), DateTime(2000, 1, 5), DateTime(2000, 1, 6), DateTime(2000, 1, 7), DateTime(2000, 1, 8), DateTime(2000, 1, 9)]
//         .map((day) => formatter.format(day))
//         .toList();
//   }

//   void initializeDateNow(String localeName) {
//     final now = DateTime.now();
//     final formatter = DateFormat(DateFormat.MONTH, localeName);

//     selectedMonth = formatter.format(now);
//     selectedYear = now.year.toString();
//   }

//   void getMonthsInYear(String localeName) {
//     // final now = DateTime.now();
//     var date = DateTime(2000, 1, 1, 1);
//     final formatter = DateFormat(DateFormat.MONTH, localeName);

//     // for (var i = 0; i < (now.year == int.parse(selectedYear!) ? now.month : 12); i++) {
//     for (var i = 0; i < 12; i++) {
//       monthList.add(formatter.format(date));
//       date = DateTime(date.year, date.month + 1);
//     }

//     update();
//   }

//   void getYearList() {
//     final now = DateTime.now();
//     // debugPrint(monthList.indexOf(selectedMonth!).toString());
//     for (var i = minYear; i <= (monthList.indexOf(selectedMonth!) + 1 > now.month ? now.year - 1 : now.year); i++) {
//       yearList.add(i.toString());
//     }

//     update();
//   }

//   String getWeekday(int weekday, String localeName) {
//     return weekDays(localeName)[weekday];
//   }

//   void setSelectedMonth(String month) {
//     debugPrint(selectedMonth);
//     selectedMonth = month;
//     // dont refresh year list
//     // yearList = <String>[];
//     // getYearList();

//     setFocusDate(DateTime(int.parse(selectedYear ?? minYear.toString()), monthList.indexOf(month) + 1));
//     // setFocusDate(DateTime(2023, 12));
//     update();
//   }

//   void setSelectedYear(String year) {
//     debugPrint(year);
//     selectedYear = year;
//     monthList = <String>[];
//     getMonthsInYear(localeConst);
//     setFocusDate(DateTime(int.parse(selectedYear ?? minYear.toString()), monthList.indexOf(selectedMonth!) + 1));
//     update();
//   }

//   void setFocusDate(DateTime date) {
//     focusedDay = date;
//     update();
//   }

//   String getFormattedSelectedDate() {
//     final formatter = DateFormat('dd/MM/yyyy', localeConst);
//     return formatter.format(selectedDay!);
//   }

//   void nextMonth(String month) {
//     if (month.toLowerCase() == 'desember') {
//       final value = yearList.indexOf(selectedYear ?? '');
//       setSelectedYear(yearList[value + 1]);
//       setSelectedMonth(monthList[0]);
//     } else {
//       final value = monthList.indexOf(month);
//       setSelectedMonth(monthList[value + 1]);
//     }
//   }

//   void previousMonth(String month) {
//     if (month.toLowerCase() == 'januari') {
//       final value = yearList.indexOf(selectedYear ?? '');
//       setSelectedYear(yearList[value - 1]);
//       setSelectedMonth(monthList[11]);
//     } else {
//       final value = monthList.indexOf(month);
//       setSelectedMonth(monthList[value - 1]);
//     }
//   }
// }
