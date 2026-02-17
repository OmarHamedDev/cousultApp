import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class ConsultantContentPersonSectionLabelWidget extends StatelessWidget {
  final String label;
  const ConsultantContentPersonSectionLabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) => Text(label, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800, color: AppColors.kBlack));

}
