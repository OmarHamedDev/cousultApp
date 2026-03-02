import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class ConsultantContentPersonSectionLabelWidget extends StatelessWidget {
  final String label;
  const ConsultantContentPersonSectionLabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) => Text(label,style: context.theme.textTheme.headlineLarge);

}
