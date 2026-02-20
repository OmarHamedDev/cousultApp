import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/theme/theme_logjc/theme_logic_provider.dart';
import '../widgets/build_profile_setting_item_widget.dart';

class ProfileThemeWidget extends StatelessWidget {
  const ProfileThemeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeLogicProvider>();
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return BuildProfileSettingItemWidget(
      title: "الوضع الليلي",
      subtitle: "تغيير مظهر التطبيق",
      icon: isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined, // تغيير الأيقونة حسب الحالة
      iconColor: Colors.indigo,
      isSwitch: true,
      switchValue: isDarkMode,
      onChanged: (val) {
        context.read<ThemeLogicProvider>().toggleTheme(val);
      },
    );
  }
}