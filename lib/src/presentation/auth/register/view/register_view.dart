import 'package:consult_app/dependency_injection/di.dart';
import 'package:consult_app/src/presentation/auth/register/view_model/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/handle_bloc_listener_register_widget.dart';
import '../widget/register_body_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RegisterCubit>(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: HandleBlocListenerRegisterWidget(
            child: RegisterBodyWidget(),
          )
      ),
    );
  }
}
