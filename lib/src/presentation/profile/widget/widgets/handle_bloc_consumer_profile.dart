import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../view_model/profile_cubit.dart';
import '../profile_body_widget.dart';

class HandleBlocConsumerProfile extends StatelessWidget {
  const HandleBlocConsumerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
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
