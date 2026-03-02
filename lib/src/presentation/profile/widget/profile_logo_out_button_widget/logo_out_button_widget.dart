import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/core/utils/functions/dialogs/awesome_dialoge.dart';
import 'package:consult_app/core/utils/functions/handle_state/handle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import '../../view_model/profile_cubit.dart';

class LogoOutButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const LogoOutButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAwesomeDialog(context,
            title: "تسجيل الخروج",
              desc: "هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟",
            onOk: () => context.read<ProfileCubit>().logout(),
            dialogType: DialogType.warning,
            buttonText: "خروج",
            onCancel: () => HandleSnakeBarDialog.popDialog(context));
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.red.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تسجيل الخروج",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            horizontalSpace(10),
            Icon(Icons.logout_rounded, color: Colors.redAccent, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
