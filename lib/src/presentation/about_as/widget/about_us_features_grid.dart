import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';

class AboutUsFeaturesGrid extends StatelessWidget {
  const AboutUsFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 15.w,
      childAspectRatio: 1.2,
      children: const [
        FeatureItemWidget(
          icon: Icons.security,
          title: "منصة آمنة",
          subTitle: "خصوصيتك أولويتنا",
        ),
        FeatureItemWidget(
          icon: Icons.verified,
          title: "استشاريون معتمدون",
          subTitle: "خبرة واحترافية",
        ),
        FeatureItemWidget(
          icon: Icons.timer,
          title: "جلسات فورية",
          subTitle: "الدعم عند الحاجة",
        ),
        FeatureItemWidget(
          icon: Icons.touch_app,
          title: "تجربة سلسة",
          subTitle: "واجهات بسيطة",
        ),
      ],
    );
  }
}
class FeatureItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const FeatureItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.mainColor, size: 30.r),
          SizedBox(height: 8.h),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.dividerColor,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
