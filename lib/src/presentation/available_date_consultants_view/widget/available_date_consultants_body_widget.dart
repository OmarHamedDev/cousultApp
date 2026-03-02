import 'package:flutter/material.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import 'detailed_consultant_clalender_available_data_consultant/detailed_consultant_calender_data_consultant.dart';
import 'detailed_consultant_content_available_data_consultant/detailed_consultant_content_available_data_consultant.dart';
import 'detailed_consultant_header_available_data_consultant/detailed_consultant_header_available_data_consultant_widget.dart';

class AvailableDateConsultantsBodyWidget extends StatelessWidget {
  const AvailableDateConsultantsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: symmetricPaddingSpace(h: 16, v: 5),
      child: Column(
        children: [
          DetailedConsultantHeaderAvailableDataConsultantWidget(),
          verticalSpace(10),
          DetailedConsultantDateNavigator(),
          verticalSpace(10),
          Expanded(child: DetailedConsultantCalenderDataConsultant()),
        ],
      ),
    );  }
}
