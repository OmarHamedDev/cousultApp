import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


 SizedBox verticalSpace(double height) => SizedBox(height: height.h);
   SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

   EdgeInsets allPaddingSpace(double value) => EdgeInsets.all(value.r);

   EdgeInsets symmetricPaddingSpace({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h.w, vertical: v.h);

   EdgeInsets onlyPaddingSpace({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );

  // اختصارات ذكية
   EdgeInsets topPaddingSpace(double value) => EdgeInsets.only(top: value.h);
   EdgeInsets startPaddingSpace(double value) => EdgeInsets.only(left: value.w); // أفضل من left عشان الـ RTL
   EdgeInsets endPaddingSpace(double value) => EdgeInsets.only(right: value.w);   // أفضل من right

