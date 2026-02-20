import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';
import 'package:consult_app/src/domain/use_case/auth/edit_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/request/profile_request/Profile_request.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  EditProfileCubit(this.editProfileUseCase) : super(EditProfileInitial());

  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  String countryCode = "";
  String image = "";
  void initialize(AppUserEntity user) {
    countryCode = "EG";
    nameController = TextEditingController(text: user.userName ?? "");
    phoneController = TextEditingController(text: user.phone ?? "");
    image = user.avatar ?? "";
    emit(EditProfileSuccessState());
  }

  ProfileRequest profileRequest() {
    return ProfileRequest(
      avatar: image,
      name: nameController.text,
      phone: phoneController.text,
      countryCode: countryCode,
    );
  }

  Future<void> editProfile() async {
    emit(EditProfileLoadingState());
    var result = await editProfileUseCase.editProfile(profileRequest());
    switch (result) {
      case Success<AppUserEntity>():
        initialize(result.date);
        emit(EditProfileSuccessState());
        break;
      case Failures<AppUserEntity>():
        emit(EditProfileErrorState(result.exception));
        break;
    }
  }
}
