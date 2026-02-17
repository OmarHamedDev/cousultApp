import 'package:flutter/material.dart';
import '../widgets/build_profile_setting_item_widget.dart';

class ProfileThemeWidget extends StatelessWidget {
  const ProfileThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildProfileSettingItemWidget(
      title: "الوضع الليلي",
      subtitle: "تغيير مظهر التطبيق",
      icon: Icons.dark_mode_outlined,
      iconColor: Colors.indigo,
      isSwitch: true,
      switchValue: true,
      // onChanged: (val) {},
    );

  }
}
