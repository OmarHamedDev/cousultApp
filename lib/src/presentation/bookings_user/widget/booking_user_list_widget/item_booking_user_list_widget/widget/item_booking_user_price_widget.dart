import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBookingUserPriceWidget extends StatelessWidget {
  final String price;
  const ItemBookingUserPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "التكلفة : ",
              style: context.textTheme.displaySmall?.copyWith(
                fontSize: 16.h,
              ),
            ),
            Text(
              "$price ج.م",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: context.theme.disabledColor,
                fontFamily: 'Rubik',
              ),
            ),
          ],
        ),
      ],
    );
  }
}


