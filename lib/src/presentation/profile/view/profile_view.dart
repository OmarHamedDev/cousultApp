import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../widget/profile_body_widget.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.kWeightLight,
      body: ProfileBodyWidget(),
    );
  }




}