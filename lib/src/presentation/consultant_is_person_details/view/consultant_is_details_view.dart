import 'package:consult_app/core/constance/constance.dart';
import 'package:consult_app/core/utils/functions/handle_state/handle_state.dart';
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:consult_app/dependency_injection/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../domain/entities/consultants_person_entity.dart';
import '../view_model/consultants_person_details_cubit.dart';
import '../widget/consult_person_bttom_booking_bar_widget/consult_person_bttom_booking_bar_widget.dart';
import '../widget/consultant_content_person_details/widget/consult_content_person_main_section_widget.dart';
import '../widget/consultant_content_person_details/widget/consult_content_person_stats_card_widget.dart';
import '../widget/consultant_content_person_details/widget/widgets/consultant_content_person_section_label_widget.dart';
import '../widget/consultant_header_person_details/consultant_header_person_details_widget.dart';

class ConsultantDetailsView extends StatelessWidget {
  const ConsultantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String consultantPersonId = GoRouterState.of(context).extra as String;

    return BlocProvider(
      create: (context) => getIt.get<ConsultantsPersonDetailCubit>()
        ..getConsultantsPerson(id: consultantPersonId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ConsultantsPersonDetailCubit, ConsultantsPersonDetailsState>(
          builder: (context, state) {
            final cubit = context.read<ConsultantsPersonDetailCubit>();

            if (state is ConsultantsPersonDetailsLoading) {
              return HandleState.loading();
            } else if (state is ConsultantsPersonDetailsError) {
              return HandleState.error(
                message: state.message ?? "حدث خطأ ما",
                onRetry: () => cubit.getConsultantsPerson(id: consultantPersonId),
              );
            } else if (cubit.consultantsPersonEntity != null) {
              final entity = cubit.consultantsPersonEntity!;
              return Stack(
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      ConsultantHeaderPersonDetailsWidget(entity: entity),
                      SliverToBoxAdapter(
                        child: _ConsultantContent(entity: entity),
                      ),
                    ],
                  ),
                  ConsultPersonBottomBookingBarWidget(price: entity.sessionPrice),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _ConsultantContent extends StatelessWidget {
  final ConsultantsPersonEntity entity;
  const _ConsultantContent({required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConsultContentPersonMainSectionWidget(entity: entity),
          verticalSpace(24),
          ConsultContentPersonStatsCardWidget(entity: entity),
          verticalSpace(32),
          const ConsultantContentPersonSectionLabelWidget(label: "نبذة عني :"),
          verticalSpace(12),
          Text(entity.description, style: TextStyle(fontSize: 15.sp, color: Colors.grey[600], height: 1.6)),
          verticalSpace(20),
          const ConsultantContentPersonSectionLabelWidget(label: "المقترح الأكاديمي : "),
          verticalSpace(12),
          Text(entity.proofPurpose, style: TextStyle(fontSize: 15.sp, color: Colors.grey[600], height: 1.6)),
          verticalSpace(32),
          const ConsultantContentPersonSectionLabelWidget(label: "المواعيد المتاحة"),
          verticalSpace(16),
          const _CalendarPlaceholder(),
          verticalSpace(100),
        ],
      ),
    );
  }
}


class _CalendarPlaceholder extends StatelessWidget {
  const _CalendarPlaceholder();
  @override
  Widget build(BuildContext context) => Container(width: double.infinity, padding: EdgeInsets.all(20.r), decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(16.r), border: Border.all(color: Colors.grey[100]!)), child: Column(children: [Icon(Icons.calendar_today_outlined, color: Colors.grey[400], size: 28.sp), verticalSpace(12), Text("لا يوجد مواعيد متاحة حالياً", style: TextStyle(fontSize: 14.sp, color: Colors.grey[500], fontWeight: FontWeight.w500))]));
}