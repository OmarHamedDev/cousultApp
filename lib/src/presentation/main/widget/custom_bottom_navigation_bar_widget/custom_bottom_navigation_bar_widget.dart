// import 'package:consult_app/core/styles/images/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../../core/styles/colors/app_colors.dart' show AppColors;
// import '../../view_model/main_cubit.dart';
//
// class CustomBottomNavigationBarWidget extends StatelessWidget {
//   const CustomBottomNavigationBarWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var currentIndex = 2;
//     return Container(
//       height: kBottomNavigationBarHeight + 56.h,
//       color: Colors.transparent,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Positioned(
//             bottom: 40.h,
//             left: 0.w,
//             right: 0.w,
//             child: Container(
//               height: 56.h,
//               decoration: BoxDecoration(
//                 color: const Color(
//                   0xFF9161C2,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15.r),
//                   topRight: Radius.circular(15.r),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildSideIcon(0),
//                   _buildSideIcon(1),
//                    SizedBox(width: 75.w,),
//                   _buildSideIcon(3),
//                   _buildSideIcon(4),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 20.w,
//             child: GestureDetector(
//               // onTap: () => setState(() => currentIndex = 2),
//               child: Container(
//                 width: 60.w,
//                 height: 60.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF4DB6AC), // درجة الأخضر المائي
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset(
//                     AppImages.iconsBottomNav[currentIndex], // دي اللي بتتبدل لما تدوس تحت                      width: 24.w,
//                     height: 24.h,
//                     colorFilter: const ColorFilter.mode(
//                       AppColors.kLightGray,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
//
//
//
//   Widget _buildSideIcon(int index,MainCubit cubit) {
//     bool isCurrentlyInCenter = cubit.selectedIndex == index;
//     bool isHomeSelected = cubit.selectedIndex  == 2;
//     return GestureDetector(
//       onTap: () {
//         // setState(() {
//         //   currentIndex = index;
//         // });
//       },
//       child: Container(
//         width: 40.w,
//         height: 40.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//         child: Center(
//           child: Opacity(
//             opacity: (isCurrentlyInCenter && isHomeSelected) ? 0.0 : 1.0,
//             child: SvgPicture.asset(
//               isCurrentlyInCenter ? AppImages.iconsBottomNav[2] : AppImages.iconsBottomNav[index],
//               width: 24.w,
//               height: 24.h,
//               colorFilter: const ColorFilter.mode(
//                 Colors.black87,
//                 BlendMode.srcIn,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:consult_app/src/presentation/main/widget/custom_bottom_navigation_bar_widget/center_action_button_nav_bar_widget.dart';
import 'package:consult_app/src/presentation/main/widget/custom_bottom_navigation_bar_widget/purple_back_ground_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/main_cubit.dart';
import 'custom_icons_botton_nav_bar_widget.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MainCubit>();
    return Container(
      height: kBottomNavigationBarHeight + 56.h,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const PurpleBackgroundBar(),
          CustomIconsBottonNavBarWidget(),
          CenterActionButtonNavBarWidget(cubit: cubit),
        ],
      ),
    );
  }
}