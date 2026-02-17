
import 'package:consult_app/core/api/common/api_result.dart';

import '../../error/error_handler.dart' show ErrorHandler;

Future<Result<T>> executeApi<T>({required Future<T> Function() apiCall}) async {
  try {
    final result = await apiCall();
    return Success(date: result);
  } on Exception catch (e) {
    final errorHandler = ErrorHandler.formException(e);

    return Failures(
      exception:  errorHandler.errorMassage,
    );
  } catch (e) {
    return Failures(
      exception: "حدث خطأ غير متوقع، حاول مرة أخرى",
    );
  }
}