import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import 'item_booking_user_list_widget.dart';

class BookingUserListWidget extends StatelessWidget {
  const BookingUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return      Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => verticalSpace(12),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            ItemBookingUserListWidget(),
        itemCount: 10,
      ),
    );
  }
}
