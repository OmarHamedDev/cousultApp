import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/core/utils/widget/section_header_widget.dart';
import 'package:consult_app/src/presentation/home/widget/widget/handle_home_bloc_builder/handle_home_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/widget/custom_tab_bar_widget.dart';
import '../../view_model/home_cubit.dart';
import 'widget/custom_book_now_consultant_widget/custom_book_now_consultant_widget.dart';
import 'widget/custom_search_home_consultant_widget/custom_search_home_consultant_widget.dart';
import 'widget/home_consultant_tabs_widget/home_consultant_tabs_widget.dart';

class HomeConsultantWidget extends StatelessWidget {
  const HomeConsultantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTabBarWidget(
           isBackButton: true,
            title: "الاستشاريون",
            button: GestureDetector(
            onTap: () {
              context.read<HomeCubit>().changeBodyWidget(true);
            },
            child: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.mainColor,size: 20.sp),),
          ),
          verticalSpace(20),
          CustomSearchHomeConsultantWidget(),
          verticalSpace(10),
          CustomBookNowConsultantWidget(),
          verticalSpace(20),
          SectionHeaderWidget(title: "المفترحوان", isShowViewAll: false,),
          verticalSpace(10),
          HomeConsultantTabsWidget(),
          verticalSpace(10),
          HandleHomeBlocBuilder()
      
        ],
      ),
    );
  }
}
