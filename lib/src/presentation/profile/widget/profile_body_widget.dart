import 'package:consult_app/src/presentation/profile/widget/profile_logo_out_button_widget/logo_out_button_widget.dart';
import 'package:consult_app/src/presentation/profile/widget/profile_setting_account_widget/profile_setting_account_widget.dart';
import 'package:consult_app/src/presentation/profile/widget/widgets/profile_main_user_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/custom_tab_bar_widget.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: symmetricPaddingSpace(h: 16, v: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBarWidget(title: "الملف الشخصي"),
            verticalSpace(30),
            ProfileMainUserCardWidget(),
            verticalSpace(25),
            ProfileSettingAccountWidget(),
            LogoOutButtonWidget(
              onTap: () {},
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}