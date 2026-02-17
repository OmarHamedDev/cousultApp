import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../profile_theme_widgeth/profile_theme_widget.dart';
import '../widgets/build_profile_section_title_widget.dart';
import '../widgets/build_profile_setting_item_widget.dart';

class ProfileSettingAccountWidget extends StatelessWidget {
  const ProfileSettingAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      BuildProfileSectionTitleWidget(title:  "إعدادات الحساب : ",
      ),
        verticalSpace(10),
        BuildProfileSettingItemWidget(
          title: "تغيير كلمة المرور",
          subtitle: "تحديث كلمة السر الخاصة بك",
          icon: Icons.lock_outline_rounded,
          iconColor: Colors.orangeAccent,
          onTap: () {},
        ),
        verticalSpace(10),
        BuildProfileSettingItemWidget(
          title: "الجلسات",
          subtitle: "تابع كل جلساتك فى مكان واحد",
          icon: Icons.calendar_month_outlined,
          iconColor: Colors.teal,
          onTap: () {},
        ),
        verticalSpace(10),
        BuildProfileSettingItemWidget(
          title: "الإشعارات",
          subtitle: "التحكم في التنبيهات والرسائل",
          icon: Icons.notifications_none_rounded,
          iconColor: Colors.blueAccent,
          onTap: () {},
        ),
        verticalSpace(10),
        ProfileThemeWidget(),
        verticalSpace(10),
        BuildProfileSettingItemWidget(
          title: "سياسة الخصوصية",
          subtitle: "كيف نحمي بياناتك ومعلوماتك",
          icon: Icons.privacy_tip_outlined,
          iconColor: Colors.blueGrey,
          onTap: () {
            // Navigate to Privacy Policy
          },
        ),
        verticalSpace(12),
      ],
    );
  }
}
