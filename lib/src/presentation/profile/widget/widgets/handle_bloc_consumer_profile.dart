import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/theme/theme_logjc/theme_logic_provider.dart';
import '../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../view_model/profile_cubit.dart';
import '../profile_body_widget.dart';

class HandleBlocConsumerProfile extends StatelessWidget {
  const HandleBlocConsumerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state is LogoOutLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is LogoOutErrorState) {
          HandleSnakeBarDialog.popDialog(context);
            HandleSnakeBarDialog.showErrorSnackBar(context, state.message);
        }else if(state is LogoOutSuccessState){
          context.read<ThemeLogicProvider>().toggleTheme(false);
          HandleSnakeBarDialog.popDialog(context);
          context.go(PageRouteName.loginScreen);
        }
      },
      builder: (context, state) {
        if (state is GetProfileLoadingState) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 300.h),
            child: HandleState.loading(),
          );
        } else if (state is GetProfileErrorState) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 150.h),
            child: HandleState.error(
              message: state.message,
              onRetry: () {
                context.read<ProfileCubit>().getProfile();
              },
            ),
          );
        }
        return ProfileBodyWidget();
      },
    );
  }
}
