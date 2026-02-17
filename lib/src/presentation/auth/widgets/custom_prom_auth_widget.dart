import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPromAuthWidget extends StatelessWidget {
  final String text;
   final String textButton;
   final  Function()? onPressed;
  const CustomPromAuthWidget({super.key, required this.text, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Colors.black87, fontSize: 14.sp)),
        TextButton(
          onPressed:onPressed,
          child: Text(textButton, style:
          TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold, fontSize: 14.sp,
              decoration: TextDecoration.underline,
            decorationStyle:  TextDecorationStyle.dotted,
            decorationColor: Colors.black,
          )),
        ),
      ],
    );
  }
}
