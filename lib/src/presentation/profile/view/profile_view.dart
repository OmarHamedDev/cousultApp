import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/core/utils/functions/handle_state/handle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/custom_tab_bar_widget.dart';
import '../../../../dependency_injection/di.dart';
import '../view_model/profile_cubit.dart';
import '../widget/profile_body_widget.dart';
import '../widget/widgets/handle_bloc_consumer_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: symmetricPaddingSpace(h: 16, v: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTabBarWidget(title: "الملف الشخصي"),
                verticalSpace(30),
                HandleBlocConsumerProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
