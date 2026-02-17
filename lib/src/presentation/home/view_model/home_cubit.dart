import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/consultants_entity.dart';
import 'package:consult_app/src/domain/use_case/get_all_consultants_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/constance/constance.dart';
import '../widget/home_consultant_widget/home_consultant_widget.dart';
import '../widget/home_widget/home_body_widget.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllConsultantsUseCase getAllConsultantsUseCase;

  HomeCubit(this.getAllConsultantsUseCase) : super(HomeInitial());

  Widget? bodyWidget = HomeBodyWidget();

  void changeBodyWidget(bool isHome) async {
    bodyWidget = isHome ? HomeBodyWidget() : HomeConsultantWidget();
    await getAllConsultants();
    selectedCategoryIndex = 0;
    emit(ChangeHomeBodyWidgetState());
  }

  List<ConsultantsEntity> consultants = [];

  Future<void> getAllConsultants({
    String? search,
    String? services,
    String? sortBy,
    String? order,
  }) async {
    emit(GetAllConsultantLoadingState());
    var result = await getAllConsultantsUseCase.call(
      search: search,
      services: services,
      sortBy: sortBy,
      order: order,
    );
    switch (result) {
      case Success<List<ConsultantsEntity>>():
        consultants = result.date;
        emit(GetAllConsultantSuccessState());
        break;
      case Failures<List<ConsultantsEntity>>():
        emit(GetAllConsultantFailuresState(result.exception.toString()));
        break;
    }
  }

  int selectedCategoryIndex = 0;

  Future<void> changeSelectedCategoryIndex(int index) async {
    selectedCategoryIndex = index;
    if (index == 0) {
      await getAllConsultants();
    } else {
      await getAllConsultants(
        services: AppConstance.serviceTranslationConsult.keys.elementAt(index),
      );
    }
    emit(ChangeSelectedCategoryIndexState());
  }

  Timer? _debounce;

  Future<void> searchConsultant(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    selectedCategoryIndex=0;
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await getAllConsultants(search: query.isEmpty ? null : query);
    });
  }

}