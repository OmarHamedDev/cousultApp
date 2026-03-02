import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles/colors/app_colors.dart';

void showAwesomeDialog(
  BuildContext context, {
  required String title,
  bool dismiss = true,
  required String desc,
  required void Function() onOk,
  void Function()? onCancel,
  void Function(DismissType)? onDismiss,
  required DialogType dialogType,
  String? buttonText,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    customHeader: _buildCustomIcon(
      context,
      dialogType,
    ), // بعتنا الـ context هنا
    title: title,
    desc: desc,
    width: kIsWeb ? 450 : null,
    dismissOnTouchOutside: dismiss,
    onDismissCallback: onDismiss,
    dialogBackgroundColor: Theme.of(
      context,
    ).cardColor, // بياخد لون الـ Card في الثيم
    titleTextStyle: TextStyle(
      color: context.theme.canvasColor, // اللون يتغير حسب المود
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    descTextStyle: TextStyle(
      color: context.theme.canvasColor, // اللون يتغير حسب المود
      fontSize: 14.sp,
    ),

    btnOkColor: AppColors.mainColor,
    btnOkText: buttonText ?? "Ok",
    btnCancelText: "إلغاء",
    btnCancelOnPress: onCancel != null
        ? () {
            FocusScope.of(context).unfocus();
            onCancel();
          }
        : null,
    btnOkOnPress: () {
      FocusScope.of(context).unfocus();
      onOk();
    },
  ).show();
}

Widget _buildCustomIcon(BuildContext context, DialogType type) {
  IconData iconData;
  Color color;
  final bool isDark = Theme.of(context).brightness == Brightness.dark;

  switch (type) {
    case DialogType.success:
      iconData = Icons.check_circle_rounded;
      color = Colors.green;
      break;
    case DialogType.error:
      iconData = Icons.error_rounded;
      color = Colors.red;
      break;
    case DialogType.warning:
      iconData = Icons.warning_amber_rounded;
      color = Colors.orange;
      break;
    default:
      iconData = Icons.info_outline;
      color = AppColors.mainColor;
  }

  return CircleAvatar(
    // خلفية الأيقونة تكون نفس لون الدايلوج عشان متبانش "مقطوعة"
    backgroundColor: Theme.of(context).cardColor,
    radius: 40,
    child: Icon(iconData, size: 60.sp, color: color),
  );
}
