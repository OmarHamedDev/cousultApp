import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../view_model/home_cubit.dart';
import '../consultant_card_list_widget/consultant_card_list_widget.dart';

class HandleHomeBlocBuilder extends StatelessWidget {
  const HandleHomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetAllConsultantLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4.h,
            child: HandleState.loading(),
          );
        } else if (state is GetAllConsultantFailuresState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4.h,
            child: HandleState.error(message: state.message),
          );
        } else {
          return HandleState.emptyList(
              contextApp: context,
              message: "لا توجد نتائج مطابقة لما تريد",
              list: homeCubit.consultants,
              child: ConsultantCardListWidget()
          );
        }
      },
    );
  }
}
