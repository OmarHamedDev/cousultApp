import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constance/constance.dart';
import '../../../../../../../core/utils/widget/cached_net_work_image_widget.dart';

class ConsultantDoctorAvatarCardWidget extends StatelessWidget {
  final String avatarUrl;
  final bool isOnline;

  const ConsultantDoctorAvatarCardWidget({super.key, required this.avatarUrl, this.isOnline = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImageWidget(
          height: 69.h,
          width: 69.w,
          imageUrl: "${AppConstance.urlImage}$avatarUrl",
        ),
        if (isOnline)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 12.r,
              height: 12.r,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}