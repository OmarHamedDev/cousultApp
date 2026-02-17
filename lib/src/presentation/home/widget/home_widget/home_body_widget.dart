import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../../config/localization/locale/app_locale.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/widget/custom_tab_bar_widget.dart';
import '../../../../../core/utils/widget/section_header_widget.dart';
import 'widget/home_banners_widget/home_banner_widget.dart';
import '../widget/handle_home_bloc_builder/handle_home_bloc_builder.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTabBarWidget(
            title: AppLocale.home.getString(context),
          ),
          verticalSpace(16),
          Text(
            AppLocale.welcomeTitle.getString(context),

            style: context.textTheme.headlineSmall,
          ),
          verticalSpace(16),
          HomeBannerWidget(),
          verticalSpace(20),
          SectionHeaderWidget(
            title: AppLocale.consultAppFavorite.getString(context),

            onViewAllTap: () {
              context.read<HomeCubit>().changeBodyWidget(false);
            },
          ),
          verticalSpace(10),
          HandleHomeBlocBuilder()
        ],
      ),
    );
  }
}
