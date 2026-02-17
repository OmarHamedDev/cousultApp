import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/src/presentation/main/view_model/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_bottom_navigation_bar_widget/custom_bottom_navigation_bar_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var mainCubit = MainCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainCubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: mainCubit.bodyWidget[mainCubit.selectedIndex],
            bottomNavigationBar: CustomBottomNavigationBarWidget(),
          );
        },
      ),
    );
  }
}
