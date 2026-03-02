import 'dart:io';
import 'package:consult_app/core/constance/constance.dart';
import 'package:dio/dio.dart';

class UploadPhotoService {
  final Dio _dio = Dio();

  Future<String> uploadPhoto({
    required String profileImagePath,
    String fieldName = 'profile_pics',
  }) async {
    try {
      final File file = File(profileImagePath);
      if (!await file.exists()) {
        throw Exception('❌ الملف غير موجود في المسار: $profileImagePath');
      }

      final fileSize = await file.length();
      const maxSize = 10 * 1024 * 1024;
      if (fileSize > maxSize) {
        throw Exception(
          '❌ حجم الملف كبير جداً (${(fileSize / (1024 * 1024)).toStringAsFixed(2)} MB). الحد الأقصى 10 MB',
        );
      }

      final String fileName = profileImagePath.split('/').last;
      FormData formData = FormData.fromMap({
        "files": [
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        ],
        "name": fieldName,
      });

      final response = await _dio.post(
        'https://api.estsheer.com/api/v1/upload',
        data: formData,
        onSendProgress: (sent, total) {
          print('Progress: ${(sent / total * 100).toStringAsFixed(0)}%');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;

        if (responseData != null && responseData['success'] == true) {
          final dataObject = responseData['data'];

          if (dataObject != null &&
              dataObject['files'] != null &&
              (dataObject['files'] as List).isNotEmpty) {

            final String relativeUrl = dataObject['files'][0]['url'] ?? "";
            final String fullUrl = relativeUrl.startsWith('http')
                ? relativeUrl
                : "${AppConstance.urlImage}$relativeUrl";

            print('✅ تم رفع الصورة بنجاح: $fullUrl');
            return fullUrl;
          } else {
            throw Exception('السيرفر لم يرسل قائمة ملفات (files) صحيحة');
          }
        } else {
          throw Exception(responseData['message'] ?? 'فشل الرفع من السيرفر');
        }
      } else {
        throw Exception('فشل الاتصال بالسيرفر: ${response.statusCode}');
      }

    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? e.message;
      print('❌ خطأ API: $errorMessage');
      throw Exception('فشل رفع الصورة: $errorMessage');
    } catch (e) {
      print('❌ خطأ عام: $e');
      throw Exception('حدث خطأ غير متوقع أثناء الرفع: $e');
    }
  }
}