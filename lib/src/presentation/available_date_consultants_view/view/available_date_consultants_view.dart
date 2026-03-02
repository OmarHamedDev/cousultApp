import 'package:consult_app/core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import 'package:consult_app/src/domain/entities/consultants_entity.dart';
import 'package:consult_app/src/presentation/available_date_consultants_view/view_model/available_date_consultants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/utils/widget/custom_app_bar_widget.dart';
import '../widget/available_date_consultants_body_widget.dart';
import '../widget/handle_bloc_consumer_available_data_consultants.dart';
import '../widget/paymob_web_view/paymob_web_view.dart';

class AvailableDateConsultantsView extends StatefulWidget {
  const AvailableDateConsultantsView({super.key});

  @override
  State<AvailableDateConsultantsView> createState() =>
      _AvailableDateConsultantsViewState();
}

class _AvailableDateConsultantsViewState
    extends State<AvailableDateConsultantsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<AvailableDateConsultantsCubit>();
      final extraData = GoRouterState.of(context).extra as ConsultantsEntity;
      cubit.consultantsEntity = extraData;
      print("${cubit.consultantsEntity?.id}");
      String startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      cubit.getAppointments(id: extraData.id, startDate: startDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(text: "المواعيد المتاحة"),
      body:HandleBlocConsumerAvailableDataConsultants(
        child: const AvailableDateConsultantsBodyWidget(),
      )
    );
  }
}



