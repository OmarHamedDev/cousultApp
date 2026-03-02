import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/country_picker_dialog.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneProfileFieldWidget extends StatelessWidget {
  const CustomPhoneProfileFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfile = context.read<EditProfileCubit>();
    final isDark = context.theme.brightness == Brightness.dark;
    return IntlPhoneField(
      controller: editProfile.phoneController,
      languageCode: "ar",
      initialCountryCode: 'EG',
      textAlign: TextAlign.left,
      disableLengthCheck: false,
      invalidMessage: "رقم هاتف غير صحيح",
      showCursor: true,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldCursorColor: context.theme.primaryColor,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        countryCodeStyle: context.textTheme.headlineSmall?.copyWith(fontSize: 14.sp),
        countryNameStyle: context.textTheme.headlineSmall?.copyWith(fontSize: 14.sp),
        searchFieldInputDecoration: InputDecoration(
          hintText: "بحث عن دولة",
          hintStyle: context.textTheme.bodyMedium,
          prefixIcon: Icon(Icons.search, color: context.theme.primaryColor),
        ),
      ),

      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: context.textTheme.headlineSmall?.copyWith(fontSize: 14.sp),
      style: context.textTheme.headlineSmall?.copyWith(fontSize: 16.sp),

      decoration: InputDecoration(
        hintText: "xxxxxxxxxxxxxxx",
        hintStyle: context.textTheme.bodyMedium?.copyWith(fontSize: 13.sp),

        fillColor: Colors.white,


        filled: true,

        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
       enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: isDark ? BorderSide(color: Colors.white10) : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      onChanged: (phone) {
        editProfile.countryCode = phone.countryISOCode;
      },
    );
  }
}