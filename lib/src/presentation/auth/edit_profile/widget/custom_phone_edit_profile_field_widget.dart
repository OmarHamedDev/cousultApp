import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneProfileFieldWidget extends StatelessWidget {
  const CustomPhoneProfileFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfile= context.read<EditProfileCubit>();
    return IntlPhoneField(
      controller: editProfile.phoneController,
      languageCode: "ar",
      initialCountryCode: 'EG',
      textAlign: TextAlign.left,
      disableLengthCheck: false,
      invalidMessage:  "رقم هاتف غير صحيح",
       showCursor: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: context.textTheme.displayMedium?.copyWith(fontSize: 14.sp),
      style: context.textTheme.displayMedium?.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "xxxxxxxxxxxxxxx",
        hintStyle: context.textTheme.displaySmall?.copyWith(fontSize: 13.sp, color: Colors.grey),
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
      onCountryChanged: (value) {
      },
      onEditingComplete: () {

      },
      onChanged: (phone) {
        editProfile.countryCode=phone.countryISOCode;

      },
    );
  }
}
