import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/utils/functions/spaceing/spaceing.dart';
import 'item_booking_user_modern_item_widget.dart';

class ItemBookingUserDataWidget extends StatelessWidget {
  final String startTime;
  final String endTime;

  const ItemBookingUserDataWidget({super.key,required this.startTime,required this.endTime});

  @override
  Widget build(BuildContext context) {
 return   Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: true ? Colors.white.withOpacity(0.03) :
        Colors.grey[50],
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: true ? Colors.white10 : Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(_getDayNumber(startTime),
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white, height: 1.1)),
                Text(_getMonthName(startTime),
                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9))),
              ],
            ),
          ),

          horizontalSpace(16),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemBookingUserModernItemWidget(
                  label:  "البداية",
                  time:   _getTime(startTime),
                  icon:
                  Icons.play_circle_outline,
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12.sp, color: Colors.grey[300]),

                ItemBookingUserModernItemWidget(
                  label:
                  "النهاية",time:  _getTime(endTime),icon:  Icons.stop_circle_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );  }
}
String _getDayNumber(String dateStr) =>
    DateFormat('dd').format(DateTime.parse(dateStr));
String _getMonthName(String dateStr) =>
    DateFormat('MMM', 'ar').format(DateTime.parse(dateStr));
String _getTime(String dateStr) =>
    DateFormat('hh:mm a', 'ar').format(DateTime.parse(dateStr).toLocal());
