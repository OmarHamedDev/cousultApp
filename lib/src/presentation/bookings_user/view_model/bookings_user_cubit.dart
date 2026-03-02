import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/constance/constance.dart';
import '../../../domain/entities/booking_user_entity.dart';
import '../../../domain/use_case/get_all_user_booking_use_case.dart';

part 'bookings_user_state.dart';

@injectable
class BookingsUserCubit extends Cubit<BookingsUserState> {
  final GetAllUserBookingUseCase getAllUserBookingUseCase;
  BookingsUserCubit(this.getAllUserBookingUseCase)
    : super(BookingsUserInitial());

  int selectedCategoryIndex = 0;
  Future<void> changeSelectedCategoryIndex(int index) async {
    selectedCategoryIndex = index;
    if (index == 0) {
      await getAllBookings();
    } else {
      await getAllBookings(
        status:
        AppConstance.bookingStatusMap
            .keys.elementAt(index),
      );
    }
    emit(ChangeSelectedCategoryIndexState());
  }

  List<BookingUserEntity> bookings = [];
  Future<void> getAllBookings({
    String? status,
}) async {
    emit(GetAllBookingUserLoadingState());
    var result = await getAllUserBookingUseCase.call(
      status: status,
    );
    switch (result) {
      case Success<List<BookingUserEntity>>():
        bookings = result.date;
        emit(GetAllBookingUserSuccessState());
        break;
      case Failures<List<BookingUserEntity>>():
        emit(GetAllBookingUserFailuresState(result.exception));
        break;
    }
  }
}
