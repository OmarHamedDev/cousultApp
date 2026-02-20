import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/dependency_injection/di.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../widget/custom_edit_profile_body_widget.dart';

class EditProfileView extends StatefulWidget {
  final AppUserEntity ? userEntity; // ضيف ده هنا عشان الـ GoRouter بيبعته
  const EditProfileView({super.key, this.userEntity});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late EditProfileCubit editProfileCubit;

  @override
  void initState() {
    editProfileCubit = context.read<EditProfileCubit>();
    editProfileCubit.initialize(
       widget.userEntity!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoadingState) {
            HandleSnakeBarDialog.showLoadingDialog(context);
          } else if (state is EditProfileErrorState) {
            HandleSnakeBarDialog.popDialog(context);
            showAwesomeDialog(
              context,
              title: "حدث خطا  هنا",
              desc: state.message,
              onOk: () {},
              dialogType: DialogType.error,
            );
          } else if (state is EditProfileSuccessState) {
           HandleSnakeBarDialog.popDialog(context);
            showAwesomeDialog(
              context,
              title: "تم بنجاح",
              desc: "تم تحديث البروفايل  بنجاح",
              dialogType: DialogType.success,
              onOk: () {
             //   context.pop(true);
              },
              onDismiss: (type) {
               context.pop(true);
              },
            );
          }
        },
        child: CustomEditProfileBodyWidget(),
      ),
    );
  }
}
