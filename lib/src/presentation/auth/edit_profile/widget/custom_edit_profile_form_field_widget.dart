import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_field_label_widget.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import 'custom_edit_profile_image_widget.dart';
import 'custom_phone_edit_profile_field_widget.dart';

class CustomEditProfileFormFieldWidget extends StatelessWidget {
  const CustomEditProfileFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileCubit = context.read<EditProfileCubit>();
    return Form(
      key: editProfileCubit.formKey,
      child: Column(
        children: [
          verticalSpace(40),
          CustomEditProfileImageWidget(),
          verticalSpace(8),
          CustomAuthFieldLabelWidget(text: "الاسم بالكامل"),
          verticalSpace(8),
          CustomAuthTextFormFieldWidget(
            controller: editProfileCubit.nameController!,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),

            hint: "أدخل اسمك بالكامل",
            icon: Icons.person_outline_rounded,
            validator: Validations.validateName
          ),
          verticalSpace(20),
          CustomAuthFieldLabelWidget(text: "رقم الهاتف"),
          verticalSpace(8),
          CustomPhoneProfileFieldWidget(),
          verticalSpace(10),
        ],
      ),
    );
  }
}
