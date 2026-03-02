import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
class PrivacySectionWidget extends StatelessWidget {
  const PrivacySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // أقسام السياسة
        const PrivacySectionItem(
          title: "1. جمع المعلومات",
          content: "نقوم بجمع المعلومات التي تقدمها لنا مباشرة عند إنشاء حساب، مثل الاسم، البريد الإلكتروني، ورقم الهاتف، لضمان تقديم تجربة مخصصة وآمنة.",
        ),
        const PrivacySectionItem(
          title: "2. حماية البيانات",
          content: "نستخدم تقنيات تشفير متطورة (SSL) لحماية بياناتك ومنع الوصول غير المصرح به. خصوصيتك هي أولويتنا القصوى في استشير.",
        ),
        const PrivacySectionItem(
          title: "3. ملفات تعريف الارتباط",
          content: "نستخدم ملفات تعريف الارتباط لتحسين أداء المنصة وفهم كيفية تفاعلك مع خدماتنا لتقديم تجربة مستخدم أفضل.",
        ),
        const PrivacySectionItem(
          title: "4. مشاركة البيانات",
          content: "لا نقوم ببيع أو تأجير بياناتك الشخصية لأطراف خارجية. يتم مشاركة البيانات فقط مع المستشارين الذين تختارهم لإتمام الجلسة.",
        ),

      ],
    );
  }
}

class PrivacySectionItem extends StatelessWidget {
  final String title;
  final String content;

  const PrivacySectionItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: theme.dividerColor.withOpacity(0.05)),
            ),
            child: Text(
              content,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.5, color: theme.dividerColor),
            ),
          ),
        ],
      ),
    );
  }
}
