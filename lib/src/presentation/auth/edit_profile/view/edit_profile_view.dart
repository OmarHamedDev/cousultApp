import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../widget/custom_edit_profile_body_widget.dart';

class EditProfileView extends StatefulWidget {
  final AppUserEntity? userEntity;
  const EditProfileView({super.key, this.userEntity});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late EditProfileCubit editProfileCubit;

  @override
  void initState() {
    editProfileCubit = context.read<EditProfileCubit>();
    if (widget.userEntity != null) {
      editProfileCubit.initialize(widget.userEntity!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is UploadImageLoadingState) {
            HandleSnakeBarDialog.showLoadingDialog(context);
          }
          else if (state is UploadImageSuccessState) {
            HandleSnakeBarDialog.popDialog(context);
          }
          else if (state is UploadImageErrorState) {
            HandleSnakeBarDialog.popDialog(context); // مهم جداً نقفل اللودينج قبل إظهار الديالوج
            showAwesomeDialog(
              context,
              title: "فشل رفع الصورة",
              desc: state.message,
              dialogType: DialogType.error,
              onOk: () {},
            );
          }
          if (state is EditProfileLoadingState) {
            HandleSnakeBarDialog.showLoadingDialog(context);
          } else if (state is EditProfileErrorState) {
            HandleSnakeBarDialog.popDialog(context);
            showAwesomeDialog(
              context,
              title: "فشل التحديث",
              desc: state.message.contains("connection")
                  ? "يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى."
                  : state.message,
              onOk: () {},
              dialogType: DialogType.error,
            );
          } else if (state is EditProfileSuccessState) {
            HandleSnakeBarDialog.popDialog(context);
            showAwesomeDialog(
              context,
              title: "تم التحديث بنجاح",
              desc: "تم حفظ تغييرات ملفك الشخصي بنجاح.",
              dialogType: DialogType.success,
              dismiss: false,
              onOk: () {
                context.pop(true);
              },
              onDismiss: (type) {
                context.pop(true);
              },
            );
          }
        },
        child: const CustomEditProfileBodyWidget(),
      ),
    );
  }
}
