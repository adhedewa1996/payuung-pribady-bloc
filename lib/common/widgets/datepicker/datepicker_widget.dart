/// Copyright 2019 Aleksander Woźniak
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/bloc/date_picker_cubit.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/bottom_sheets.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/header_minimal.dart';
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
    return BlocConsumer<DatePickerCubit, DatePickerState>(
      listener: (context, state) {
        inspect(state.datePickerData);
      },
      builder: (context, state) {
        inspect(state.datePickerData);
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
                        title: state.datePickerData?.selectedMonth ?? '',
                        titleStyle: context.theme().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme().colorScheme.primary,
                            ),
                        marginTop: 16,
                        marginBottom: 16,
                        marginLeft: 16,
                        callback: () {
                          bottomSheetNormal(
                            title: 'Pilih Bulan',
                            list: state.datePickerData?.monthList ?? [],
                            selected: state.datePickerData?.selectedMonth ?? '',
                            callback: (text) {
                              context.read<DatePickerCubit>().setSelectedMonth(text);
                            },
                            paddingLeft: 16,
                            paddingRight: 16,
                            paddingTop: 16,
                            paddingBottom: 16,
                            showLeading: false,
                            context: context,
                          );
                        },
                      ),
                      HeaderMinimal(
                        title: state.datePickerData?.selectedYear ?? '',
                        titleStyle: context.theme().textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme().colorScheme.primary,
                            ),
                        marginTop: 16,
                        marginBottom: 16,
                        marginLeft: 16,
                        callback: () {
                          bottomSheetNormal(
                            title: 'Pilih Tahun',
                            list: state.datePickerData?.yearList?.reversed.toList() ?? [],
                            selected: state.datePickerData?.selectedYear ?? '',
                            callback: (text) {
                              context.read<DatePickerCubit>().setSelectedYear(text);
                            },
                            paddingLeft: 16,
                            paddingRight: 16,
                            paddingTop: 16,
                            paddingBottom: 16,
                            showLeading: false,
                            context: context,
                          );
                        },
                      ),
                    ],
                  ),
                  if (state.datePickerData?.showArrow ?? false)
                    Row(
                      children: [
                        arrow(
                          selectedMonth: state.datePickerData?.selectedMonth ?? '',
                          selectedYear: state.datePickerData?.selectedYear ?? '',
                          valueMonth: state.datePickerData?.monthList?.first ?? '',
                          valueYear: state.datePickerData?.yearList?.first ?? '',
                          icon: Icons.keyboard_arrow_up_rounded,
                          callback: () {
                            context.read<DatePickerCubit>().previousMonth(state.datePickerData?.selectedMonth ?? '');
                          },
                        ),
                        SizedBox(width: 24),
                        arrow(
                          selectedMonth: state.datePickerData?.selectedMonth ?? '',
                          selectedYear: state.datePickerData?.selectedYear ?? '',
                          valueMonth: state.datePickerData?.monthList?.last ?? '',
                          valueYear: state.datePickerData?.yearList?.last ?? '',
                          icon: Icons.keyboard_arrow_down_rounded,
                          callback: () {
                            context.read<DatePickerCubit>().nextMonth(state.datePickerData?.selectedMonth ?? '');
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
                          context.read<DatePickerCubit>().getWeekday(date.weekday - 1, state.datePickerData?.localeConst ?? 'id').substring(0, 3).toUpperCase(),
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
                          decoration: BoxDecoration(color: context.theme().primaryColor, shape: BoxShape.circle),
                          child: Center(child: Text(date1.day.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ),
                      );
                    },
                  ),
                  firstDay: state.datePickerData?.kFirstDay ?? DateTime(1900),
                  lastDay: state.datePickerData?.kLastDay ?? DateTime.now(),
                  focusedDay: state.datePickerData?.focusedDay ?? DateTime.now(),
                  calendarFormat: state.datePickerData?.calendarFormat ?? CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(state.datePickerData?.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(state.datePickerData?.selectedDay, selectedDay)) {
                      context.read<DatePickerCubit>().setIsSelectedDay(
                            selectedDay: selectedDay,
                            focusedDay: focusedDay,
                            status: true,
                          );
                    }
                  },
                  onFormatChanged: (format) {
                    if (state.datePickerData?.calendarFormat != format) {
                      context.read<DatePickerCubit>().onFormatChanged(format);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    context.read<DatePickerCubit>().onPageChanged(
                          focusedDay: focusedDay,
                        );
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
                            return BorderSide(color: context.theme().primaryColor);
                          }),
                        ),
                        child: Text('Cancel', style: TextStyle(color: context.theme().primaryColor)),
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
                          backgroundColor: MaterialStateProperty.all((state.datePickerData?.isSelectedDay ?? false) ? context.theme().primaryColor : Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                            if (state.datePickerData?.isSelectedDay ?? false) {
                              return BorderSide(color: context.theme().primaryColor);
                            }
                            return BorderSide(color: Colors.grey);
                          }),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Text('Done', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          log('HALO');
                          if (state.datePickerData?.isSelectedDay ?? false) {
                            widget.onSetDate(state.datePickerData?.selectedDay);
                          } else {
                            log('WALAH');
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
