import 'package:consult_app/dependency_injection/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../view_model/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var homeCubit = getIt.get<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit..getAllConsultants(),
      child: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: symmetricPaddingSpace(h: 16, v: 16),
                child: context.read<HomeCubit>().bodyWidget,
              ),
            );
          },
        ),
      ),
    );
  }
}
