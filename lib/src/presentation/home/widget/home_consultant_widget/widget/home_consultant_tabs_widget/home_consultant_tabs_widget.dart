import 'package:consult_app/core/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../view_model/home_cubit.dart';
import 'home_consultant_item_tab_widget.dart';

class HomeConsultantTabsWidget extends StatelessWidget {
  const HomeConsultantTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () async =>
                  await homeCubit.changeSelectedCategoryIndex(index),
              child: HomeConsultantItemTabWidget(
                isSelected: index == homeCubit.selectedCategoryIndex
                    ? true
                    : false,
                title: AppConstance.serviceTranslationConsult.values.elementAt(
                  index,
                ),
              ),
            ),
            itemCount: AppConstance.serviceTranslationConsult.length,
            separatorBuilder: (context, index) => horizontalSpace(5),
          ),
        );
      },
    );
  }
}
