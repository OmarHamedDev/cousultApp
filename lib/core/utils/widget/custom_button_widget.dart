import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  const CustomButtonWidget({super.key,
   this.color=AppColors.mainColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color:color,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
        ),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
