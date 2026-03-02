import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:consult_app/src/presentation/privacy_policy/widget/privacy_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/privacy_header_widget.dart';
import '../widget/privacy_section_widget.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

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
                const PrivacyAppBar(),
                verticalSpace(20),
                const PrivacyHeader(),
                verticalSpace(30),
                PrivacySectionWidget(),
                verticalSpace(40),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


