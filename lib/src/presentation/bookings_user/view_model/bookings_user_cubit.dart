import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bookings_user_state.dart';

@injectable
class BookingsUserCubit extends Cubit<BookingsUserState> {
  BookingsUserCubit() : super(BookingsUserInitial());

  int selectedCategoryIndex = 0;
  Future<void> changeSelectedCategoryIndex(int index) async {
    selectedCategoryIndex = index;
    if (index == 0) {
     // await getAllConsultants();
    } else {
      // await getAllConsultants(
      //   services:
      //   AppConstance.serviceTranslationConsult
      //       .keys.elementAt(index),
      // );
    }
    emit(ChangeSelectedCategoryIndexState());
  }
}
