import 'package:consult_app/src/presentation/auth/change_password/widget/custom_change_password_body_widget.dart';
import 'package:consult_app/src/presentation/auth/change_password/widget/handle_bloc_listener_change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../dependency_injection/di.dart';
import '../view_model/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChangePasswordCubit>(),
      child: HandleBlocListenerChangePasswordState(child:
        Scaffold(body: CustomChangePasswordBodyWidget()),
      )

    );
  }
}
