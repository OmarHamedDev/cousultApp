import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/register_cubit.dart';

class CustomPhoneFieldWidget extends StatelessWidget {
  const CustomPhoneFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    return IntlPhoneField(
      controller: registerCubit.phoneController,
      languageCode: "ar",
      initialCountryCode: 'EG',
      textAlign: TextAlign.right,
      disableLengthCheck: true,

      invalidMessage: "رقم هاتف غير صحيح",
      showCursor: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: context.textTheme.displayMedium?.copyWith(
        fontSize: 14.sp,
      ),
      style: context.textTheme.displayMedium?.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return "يجب إدخال رقم الهاتف";
        }
        // String actualNumber = phone.number;
        // if (actualNumber.startsWith('0')) {
        //   actualNumber = actualNumber.substring(1);
        // }
        // try {
        //   if (!phone.isValidNumber()) {
        //     return "رقم هاتف غير صحيح";
        //   }
        // } catch (e) {
        //   return "حدث خطأ في التحقق";
        // }

        return null;
      },
      decoration: InputDecoration(
        hintText: "ادخل رقم الهاتف  ",
        hintStyle: context.textTheme.displaySmall?.copyWith(
          fontSize: 13.sp,
          color: Colors.grey,
        ),
        fillColor: Colors.white,

        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
      onCountryChanged: (value) {},
      onEditingComplete: () {},
      onChanged: (phone) {
        registerCubit.countryCode=phone.countryISOCode;
      },
    );
  }
}
