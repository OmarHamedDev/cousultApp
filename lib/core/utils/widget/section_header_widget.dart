import 'package:consult_app/config/localization/locale/app_locale.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final bool isShowViewAll;
  final VoidCallback? onViewAllTap;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.isShowViewAll=true
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: context.textTheme.headlineLarge),
        const Spacer(),
        isShowViewAll ? GestureDetector(
          onTap: onViewAllTap,
          child: Text(
            AppLocale.viewAll.getString(context),
            style: context.textTheme.headlineMedium,
          ),
        ) :Container(),
      ],
    );
  }
}
