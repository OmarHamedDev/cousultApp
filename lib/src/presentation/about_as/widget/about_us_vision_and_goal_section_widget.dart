import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart' show verticalSpace;

class AboutUsVisionAndGoalSection extends StatelessWidget {
  const AboutUsVisionAndGoalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AboutUsSectionTitle(title: "رؤيتنا"),
        Text(
          "أن تكون استشير المنصة العربية الأولى في تقديم الاستشارات الرقمية ومرجعاً موثقاً يسهم في تحسين جودة الحياة وتعزيز الصحة النفسية والاجتماعية في الوطن العربي.",
          style: theme.textTheme.bodyLarge?.copyWith(color: theme.dividerColor),
        ),
        verticalSpace(30),
        const AboutUsSectionTitle(title: "هدفنا"),
        AboutUsSectionCard(
          child: Text(
            "تمكين الأفراد من الوصول إلى استشاريين معتمدين بسهولة وسرية عبر تجربة رقمية إنسانية تجمع بين الاحترافية والبساطة.",
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.dividerColor),
          ),
        ),
      ],
    );
  }
}class AboutUsSectionTitle extends StatelessWidget {
  final String title;
  const AboutUsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(width: 5.w, height: 25.h, color: AppColors.mainColor),
          SizedBox(width: 10.w),
          Text(title, style: theme.textTheme.headlineLarge),
        ],
      ),
    );
  }
}
class AboutUsSectionCard extends StatelessWidget {
  final Widget child;
  const AboutUsSectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
