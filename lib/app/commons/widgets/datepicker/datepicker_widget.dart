/// Copyright 2019 Aleksander Woźniak
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/bottom_sheets.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/datepicker_controller.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/header_minimal.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.onCancel,
    required this.onSetDate,
    required this.selectedDay,
  });

  final VoidCallback onCancel;
  final ValueChanged<DateTime?> onSetDate;
  final DateTime? selectedDay;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      init: DatePickerController(selectedDay: widget.selectedDay),
      builder: (DatePickerController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      HeaderMinimal(
                        title: controller.selectedMonth ?? '',
                        titleStyle: context.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.primary,
                        ),
                        marginTop: 16,
                        marginBottom: 16,
                        marginLeft: 16,
                        callback: () {
                          bottomSheetNormal(
                            title: 'Pilih Bulan',
                            list: controller.monthList,
                            selected: controller.selectedMonth ?? '',
                            callback: (text) {
                              controller.setSelectedMonth(text);
                            },
                            paddingLeft: 16,
                            paddingRight: 16,
                            paddingTop: 16,
                            paddingBottom: 16,
                            showLeading: false,
                          );
                        },
                      ),
                      HeaderMinimal(
                        title: controller.selectedYear ?? '',
                        titleStyle: context.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.primary,
                        ),
                        marginTop: 16,
                        marginBottom: 16,
                        marginLeft: 16,
                        callback: () {
                          bottomSheetNormal(
                            title: 'Pilih Tahun',
                            list: controller.yearList.reversed.toList(),
                            selected: controller.selectedYear ?? '',
                            callback: (text) {
                              controller.setSelectedYear(text);
                            },
                            paddingLeft: 16,
                            paddingRight: 16,
                            paddingTop: 16,
                            paddingBottom: 16,
                            showLeading: false,
                          );
                        },
                      ),
                    ],
                  ),
                  if (controller.showArrow)
                    Row(
                      children: [
                        arrow(
                          selectedMonth: controller.selectedMonth ?? '',
                          selectedYear: controller.selectedYear ?? '',
                          valueMonth: controller.monthList.first,
                          valueYear: controller.yearList.first,
                          icon: Icons.keyboard_arrow_up_rounded,
                          callback: () {
                            controller.previousMonth(controller.selectedMonth ?? '');
                          },
                        ),
                        SizedBox(width: 24),
                        arrow(
                          selectedMonth: controller.selectedMonth ?? '',
                          selectedYear: controller.selectedYear ?? '',
                          valueMonth: controller.monthList.last,
                          valueYear: controller.yearList.last,
                          icon: Icons.keyboard_arrow_down_rounded,
                          callback: () {
                            controller.nextMonth(controller.selectedMonth ?? '');
                          },
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Flexible(
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerVisible: false,
                  availableGestures: AvailableGestures.none,
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, date) {
                      return Center(
                        child: Text(
                          controller.getWeekday(date.weekday - 1, controller.localeConst).substring(0, 3).toUpperCase(),
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                        ),
                      );
                    },
                    todayBuilder: (context, date1, date2) {
                      return Padding(
                        padding: EdgeInsets.all(6),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Center(child: Text(date1.day.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        ),
                      );
                    },
                    selectedBuilder: (context, date1, date2) {
                      return Padding(
                        padding: EdgeInsets.all(6),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: context.theme.primaryColor, shape: BoxShape.circle),
                          child: Center(child: Text(date1.day.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ),
                      );
                    },
                  ),
                  firstDay: controller.kFirstDay!,
                  lastDay: controller.kLastDay!,
                  focusedDay: controller.focusedDay,
                  calendarFormat: controller.calendarFormat,
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(controller.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(controller.selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      controller.selectedDay = selectedDay;
                      controller.focusedDay = focusedDay;
                      controller.update();
                      controller.setIsSelectedDay(true);
                    }
                  },
                  onFormatChanged: (format) {
                    if (controller.calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      controller.calendarFormat = format;
                      controller.update();
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    controller.setFocusDate(focusedDay);
                    controller.setSelectedMonth(controller.monthList[focusedDay.month - 1]);
                    controller.setSelectedYear(focusedDay.year.toString());
                  },
                  enabledDayPredicate: (day) => day.isBefore(DateTime.now()),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                            return BorderSide(color: context.theme.primaryColor);
                          }),
                        ),
                        child: Text('Cancel', style: TextStyle(color: context.theme.primaryColor)),
                        onPressed: () async => {
                          widget.onCancel(),
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
                          backgroundColor: MaterialStateProperty.all(controller.isSelectedDay ? context.theme.primaryColor : Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                            if (controller.isSelectedDay) {
                              return BorderSide(color: context.theme.primaryColor);
                            }
                            return BorderSide(color: Colors.grey);
                          }),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Text('Done', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          if (controller.isSelectedDay) {
                            widget.onSetDate(controller.selectedDay);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget arrow({
    required String selectedMonth,
    required String selectedYear,
    required String valueMonth,
    required String valueYear,
    required IconData icon,
    required Function() callback,
  }) {
    return IconButton(
      onPressed: () {
        if ((selectedMonth == valueMonth) && (selectedYear == valueYear)) {
        } else {
          callback();
        }
      },
      icon: Icon(
        icon,
        color: (selectedMonth == valueMonth) && (selectedYear == valueYear) ? Colors.grey : Colors.black,
      ),
    );
  }
}
