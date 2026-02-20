import 'package:bloc/bloc.dart';
import 'package:consult_app/src/presentation/reels/view/reels_view.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../home/view/home_view.dart';
import '../../profile/view/profile_view.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


  int selectedIndex = 4;
   List<Widget>bodyWidget=[
     ProfileView(),
     const ReelsView(),
     const HomeView(),
     const ReelsView(),
     ProfileView(),
   ];


  void changeBottomNavIndex(int newIndex) {
    if (newIndex == selectedIndex) {
      selectedIndex = 2;
    } else {
      selectedIndex = newIndex;
    }

    emit(ChangeBottomNavIndex());
  }

}
