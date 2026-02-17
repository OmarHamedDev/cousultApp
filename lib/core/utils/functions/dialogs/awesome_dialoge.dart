import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../styles/colors/app_colors.dart';
void showAwesomeDialog(
    BuildContext context, {
      required String title,
      bool dismiss = true,
      required String desc,
      required void Function() onOk,
      void Function()? onCancel,
      required DialogType dialogType,
      String? buttonText,
    }) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    customHeader: _buildCustomIcon(dialogType),
    title: title,
    desc: desc,
    width: kIsWeb ? 450 : null,
    dismissOnTouchOutside: dismiss,
    dialogBackgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        color: AppColors.mainColor, fontSize: 22, fontWeight: FontWeight.bold),
    descTextStyle: const TextStyle(color: Colors.black87, fontSize: 16),
    btnOkColor: AppColors.mainColor,
    btnOkText: buttonText ?? "Ok",
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

Widget _buildCustomIcon(DialogType type) {
  IconData iconData;
  Color color;

  switch (type) {
    case DialogType.success:
      iconData = Icons.check_circle_outline;
      color = Colors.green;
      break;
    case DialogType.error:
      iconData = Icons.error_outline;
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
    backgroundColor: Colors.white,
    radius: 40,
    child: Icon(iconData, size: 70, color: color),
  );
}