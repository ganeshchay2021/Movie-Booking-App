// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_booking_app/domain/constant/ui_helper.dart';

class TimeSlotWidget extends StatelessWidget {
  final String time;
  final Color cntColor;
  final Color textCOlor;
  const TimeSlotWidget({
    super.key,
    required this.time,
    required this.cntColor,
    required this.textCOlor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 120,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cntColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffeed51e),
          width: 3,
        ),
      ),
      child: UiHelper.customText(
        text: time,
        fontsize: 20,
        fontWeight: FontWeight.w800,
        color: textCOlor,
      ),
    );
  }
}
