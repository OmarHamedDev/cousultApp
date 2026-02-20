import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/src/presentation/profile/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        const BuildProfileSectionTitleWidget(title: "إعدادات الأمان : "),
        verticalSpace(12),
        BuildProfileSettingItemWidget(
          title: "تحديث البيانات",
          subtitle: "تعديل معلومات حسابك الشخصي",
          icon: Icons.person_outline_rounded,
          iconColor: Colors.blueAccent,
          onTap: () async{
           var result=await context.push(PageRouteName.editProfile,
           extra: context.read<ProfileCubit>().appUserEntity,
           );
           if(result==true){
             context.read<ProfileCubit>().getProfile();
           }
          },
        ),
        verticalSpace(12),

        BuildProfileSettingItemWidget(
          title: "تغيير كلمة المرور",
          subtitle: "تحديث كلمة السر الخاصة بك",
          icon: Icons.lock_outline_rounded,
          iconColor: Colors.orangeAccent,
          onTap: () {
            context.push(PageRouteName.changePassword);
          },
        ),
        verticalSpace(24),
        const BuildProfileSectionTitleWidget(title: "النشاط والمظهر : "),
        verticalSpace(12),
        BuildProfileSettingItemWidget(
          title: "الجلسات",
          subtitle: "تابع كل جلساتك فى مكان واحد",
          icon: Icons.calendar_month_outlined,
          iconColor: Colors.teal,
          onTap: () {},
        ),
        verticalSpace(12),
        const ProfileThemeWidget(),
        verticalSpace(24),
        const BuildProfileSectionTitleWidget(title: "الدعم والخصوصية : "),
        verticalSpace(12),
        BuildProfileSettingItemWidget(
          title: "سياسة الخصوصية",
          subtitle: "كيف نحمي بياناتك ومعلوماتك",
          icon: Icons.privacy_tip_outlined,
          iconColor: Colors.blueGrey,
          onTap: () {},
        ),
        verticalSpace(16),
      ],
    );
  }
}
