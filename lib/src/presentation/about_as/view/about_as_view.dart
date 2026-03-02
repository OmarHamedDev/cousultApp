import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/about_as_app_bar_widget.dart';
import '../widget/about_us_features_grid.dart';
import '../widget/about_us_header_widget.dart';
import '../widget/about_us_intro_card_widget.dart';
import '../widget/about_us_vision_and_goal_section_widget.dart';
import '../widget/about_uscta_section_widget.dart';

class AboutAsView extends StatelessWidget {
  const AboutAsView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutUsAppBar(),
                verticalSpace(20),
                const AboutUsHeader(),
                verticalSpace(30),
                 AboutUsIntroCard(),
                verticalSpace(40),
                const AboutUsVisionAndGoalSection(),
                verticalSpace(30),
                const AboutUsFeaturesGrid(),
                verticalSpace(40),
                const AboutUsCTASection(),
                verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

