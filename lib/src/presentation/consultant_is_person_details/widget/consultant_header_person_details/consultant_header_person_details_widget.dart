import 'package:consult_app/core/utils/widget/cached_net_work_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constance/constance.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../domain/entities/consultants_person_entity.dart';
import 'custom_back_button_widget.dart';

class ConsultantHeaderPersonDetailsWidget extends StatelessWidget {
  final ConsultantsPersonEntity entity;
  const ConsultantHeaderPersonDetailsWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320.h,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      leadingWidth: 70.w,
      leading: const CustomBackButton(),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;
          bool isCollapsed =
              top <= (MediaQuery.of(context).padding.top + kToolbarHeight + 20);
          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isCollapsed ? 1.0 : 0.0,
              child: Text(
                "د/${entity.name}",
                style: TextStyle(
                  color: AppColors.kBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImageWidget(
                  imageUrl: "${AppConstance.urlImage}${entity.avatar}",
                  height: 320.h,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: const Alignment(0.0, -0.2),
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: const [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
