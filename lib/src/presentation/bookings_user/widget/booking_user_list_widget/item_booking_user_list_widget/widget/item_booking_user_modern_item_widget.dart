import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/functions/spaceing/spaceing.dart';

class ItemBookingUserModernItemWidget extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;


  const ItemBookingUserModernItemWidget({
    super.key,
    required this.label,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14.sp,
                color: context.theme.dividerColor),
            horizontalSpace(4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: context.theme.dividerColor,
              ),
            ),
          ],
        ),
        verticalSpace(4),
        Text(
          time,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w900,
            color: context.theme.canvasColor,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
