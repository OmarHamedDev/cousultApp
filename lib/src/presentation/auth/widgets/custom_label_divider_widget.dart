import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLabelDividerWidget extends StatelessWidget {
  const CustomLabelDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black12, // لون خفيف جداً عشان ميزعجش العين
            thickness: 1,
            endIndent: 15, // مسافة بين الخط والكلمة
          ),
        ),

        // كلمة "أو" بتنسيق شيك
        Text(
          "أو عبر",
          style: TextStyle(
            color: Colors.black45, // لون رمادي هادي
            fontSize: 15.sp,
            fontWeight: FontWeight.w500, // وزن متوسط
            fontFamily: 'Cairo', // لو عندك خط Cairo في المشروع
          ),
        ),

        // خط ناحية الشمال
        const Expanded(
          child: Divider(
            color: Colors.black12,
            thickness: 1,
            indent: 15, // مسافة بين الكلمة والخط
          ),
        ),
      ],
    );
  }
}
