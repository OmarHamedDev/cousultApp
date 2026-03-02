import 'package:consult_app/src/presentation/available_date_consultants_view/widget/paymob_web_view/payment_result_dialog.dart';
import 'package:consult_app/src/presentation/available_date_consultants_view/widget/paymob_web_view/paymob_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart' show HandleSnakeBarDialog;
import '../view_model/available_date_consultants_cubit.dart';

class HandleBlocConsumerAvailableDataConsultants
    extends StatelessWidget {
  final Widget child;
  const HandleBlocConsumerAvailableDataConsultants({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailableDateConsultantsCubit, AvailableDateConsultantsState>(
      listener: (context, state) async {
        if (state is PaymentConsultantsLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        }
        else if (state is PaymentConsultantsSuccessState) {
          final cubit = context.read<AvailableDateConsultantsCubit>();
          final paymentUrl = cubit.linkUrl;
          HandleSnakeBarDialog.popDialog(context);
          if (paymentUrl != null && paymentUrl.isNotEmpty) {
            final bool? isSuccess = await Navigator.of(context).push<bool>(
              MaterialPageRoute(
                builder: (context) => PaymobWebView(url: paymentUrl),
              ),
            );
            if (context.mounted) {
              _showResultAndRefresh(context, cubit, isSuccess ?? false);
            }}}
        else if (state is PaymentConsultantsErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          HandleSnakeBarDialog.showErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }

  void _showResultAndRefresh(BuildContext context, AvailableDateConsultantsCubit cubit, bool isSuccess) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => PaymentResultDialog(
        isSuccess: isSuccess,
        onDone: () {
          if (isSuccess) {
            cubit.getAppointments(
              id: cubit.consultantsEntity?.id ?? "",
              startDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            );
          }
        },
      ),
    );
  }
}
