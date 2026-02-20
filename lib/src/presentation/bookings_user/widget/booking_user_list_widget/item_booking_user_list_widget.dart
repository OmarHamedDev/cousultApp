import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../widgets/consult_card_core_widget/consultant_info_section_card_widget.dart';

class ItemBookingUserListWidget extends StatelessWidget {
  const ItemBookingUserListWidget({super.key});
  String _getDayNumber(String dateStr) => DateFormat('dd').format(DateTime.parse(dateStr));
  String _getMonthName(String dateStr) => DateFormat('MMM', 'ar').format(DateTime.parse(dateStr));
  String _getTime(String dateStr) => DateFormat('jm', 'ar').format(DateTime.parse(dateStr).toLocal());

  @override
  Widget build(BuildContext context) {
    const String startTime = "2026-02-19T23:55:38.069Z";
    const String endTime = "2026-02-20T00:35:38.069Z";

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade50),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Text(_getDayNumber(startTime),
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text(_getMonthName(startTime),
                        style: TextStyle(fontSize: 12.sp, color: Colors.blueGrey)),
                  ],
                ),
              ),
              horizontalSpace(12),
              const Expanded(
                child: ConsultantInfoSectionCardWidget(
                  title: "Flutter Developer",
                  name: "Omar Makram",
                  rating: 4.8,
                ),
              ),
              _buildStatusChip("PENDING"),
            ],
          ),

          verticalSpace(16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _timeInfoBlock(Icons.access_time_filled_rounded,
                    "البداية", _getTime(startTime)),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, size: 12.sp, color: Colors.grey[300]),
                const Spacer(),
                _timeInfoBlock(Icons.check_circle_rounded, "النهاية", _getTime(endTime)),
              ],
            ),
          ),

          verticalSpace(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // السعر
              Row(
                children: [
                  Text("إجمالي السعر: ", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  Text("100 ج.م", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
              // مدة الجلسة (بدل زر الحجز)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer_outlined, size: 14.sp, color: Colors.blue),
                    horizontalSpace(4),
                    Text("40 دقيقة", style: TextStyle(fontSize: 11.sp, color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeInfoBlock(IconData icon, String label, String time) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: Colors.blueGrey[300]),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
            Text(time, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color color = status == 'PENDING' ? Colors.orange : Colors.green;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6.r)),
      child: Text(
        status == 'PENDING' ? 'قيد الانتظار' : 'مؤكد',
        style: TextStyle(color: color, fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}