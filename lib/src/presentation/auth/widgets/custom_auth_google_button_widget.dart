import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';

class CustomAuthGoogleButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomAuthGoogleButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(backgroundColor: Colors.white, side: const BorderSide(color: Colors.black12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.g_mobiledata, color: Colors.red, size: 35),
            horizontalSpace(8),
            Text("متابعة باستخدام Google", style: TextStyle(color: Colors.black87, fontSize: 15.sp, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
