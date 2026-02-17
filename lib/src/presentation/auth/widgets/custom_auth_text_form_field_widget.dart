import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthTextFormFieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? prefixText;
  final Widget? suffixIcon;
  final TextEditingController controller;

  const CustomAuthTextFormFieldWidget({
    super.key,
    this.suffixIcon,
   required this.controller ,
    this.validator,
    this.keyboardType,
    this.prefixText,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 16.sp, color: Colors.black),
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black54),
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black38),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        errorStyle: TextStyle(fontSize: 12.sp, color: Color(0xFFFFD700)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
