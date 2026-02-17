import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultContentPersonDetailsAboutInfoActionIconButtonWidget
    extends StatelessWidget {
  final IconData icon;
  final Color color;
  const ConsultContentPersonDetailsAboutInfoActionIconButtonWidget({
    super.key,
    required this.icon,
    required this.color,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(10.r),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFFF0F0F0)),
    ),
    child: Icon(icon, color: color, size: 22.sp),
  );
}
