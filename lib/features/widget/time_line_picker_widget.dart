import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:trip_tracking/features/utlility/constants_string.dart';

class TimeLinePickerWidget extends StatelessWidget {
  final DateTime? initialSelectedDate;
  final void Function(DateTime)? onDateChange;
  const TimeLinePickerWidget(
      {super.key, this.initialSelectedDate, this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: initialSelectedDate,
      selectionColor: Colors.white,
      selectedTextColor: const Color.fromRGBO(74, 20, 140, 1),
      dayTextStyle: const TextStyle(color: Colors.white),
      dateTextStyle: const TextStyle(color: Colors.white),
      monthTextStyle: const TextStyle(color: Colors.white),
      locale: ConstantsString.locale,
      onDateChange: onDateChange,
    );
  }
}
