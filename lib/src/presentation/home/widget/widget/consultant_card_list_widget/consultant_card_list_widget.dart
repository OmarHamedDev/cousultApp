import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../view_model/home_cubit.dart';
import 'widgets/home_consult_card_widget/home_consult_card_widget.dart';

class ConsultantCardListWidget extends StatelessWidget {
  const ConsultantCardListWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: symmetricPaddingSpace(h: 0, v: 10),
      itemCount: homeCubit.consultants.length,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (context, index) {
        return HomeConsultCardWidget(
          consultantsEntity: homeCubit.consultants[index],
        );
      },
    );
  }
}
