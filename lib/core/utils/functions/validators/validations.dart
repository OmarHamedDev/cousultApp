import 'app_regex.dart';

abstract class Validations {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return '⚠️ الاسم مطلوب ولا يمكن أن يكون فارغاً.';
    } else if (!AppRegExp.isNameValid(name)) {
      return '⚠️ اسم غير صالح! يسمح بالأحرف فقط.';
    }
    return null;
  }

  static String? validateCountry(String? country) {
    if (country == null || country.trim().isEmpty) {
      return '⚠️ الدولة مطلوبة ولا يمكن أن تكون فارغة.';
    }
    return null;
  }

  static String? validateBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.trim().isEmpty) {
      return '⚠️ تاريخ الميلاد مطلوب.';
    }
    return null;
  }

  static String? componyName(String? componyName) {
    if (componyName == null || componyName.isEmpty) {
      return 'يرجى إدخال اسم الشركة';
    }
    if (componyName.length < 3) {
      return 'يجب أن يكون الاسم 3 أحرف على الأقل';
    }
    return null;
  }

  static String? validateWebsite(String? website) {
    if (website == null || website.isEmpty) {
      return 'يرجى إدخال رابط الموقع الإلكتروني';
    }
    if (!website.startsWith('http://') && !website.startsWith('https://')) {
      return 'يرجى إدخال رابط صالح (URL)';
    }
    return null;
  }

  static String? validateDescription(String? description) {
    if (description == null || description.trim().isEmpty) {
      return '⚠️ الوصف مطلوب.';
    }
    return null;
  }

  static String? validateStudentId(String? id) {
    if (id == null || id.trim().isEmpty) {
      return '⚠️ رقم الطالب مطلوب.';
    } else if (!AppRegExp.isNationalIDValid(id)) {
      return '⚠️ رقم غير صالح! يجب أن يتكون من 6 أرقام.';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return '⚠️ البريد الإلكتروني مطلوب.';
    } else if (!AppRegExp.isEmailValid(email)) {
      return '⚠️ صيغة البريد غير صحيحة! مثال: example@domain.com';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return '⚠️ رقم الهاتف مطلوب.';
    } else if (!AppRegExp.isPhoneNumberValid(phoneNumber)) {
      return '⚠️ رقم هاتف غير صالح! يجب أن يتكون من 10 أرقام.';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '⚠️ كلمة المرور مطلوبة.';
    } else if (!AppRegExp.isPasswordValid(password)) {
      return '⚠️ كلمة مرور ضعيفة! يجب أن تكون 8 أحرف على الأقل.';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password,
      String? confirmPassword,
      ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return '⚠️ تأكيد كلمة المرور مطلوب.';
    } else if (password != confirmPassword) {
      return '⚠️ كلمة المرور وتأكيدها غير متطابقين.';
    }
    return null;
  }

  static String? validateTextIsEmpty(String? text) {
    if (text == null || text.trim().isEmpty) {
      return '⚠️ هذا الحقل مطلوب.';
    }
    return null;
  }

  static String? validateTextIsOnlyNumbers(String? text) {
    if (text == null || text.trim().isEmpty) {
      return '⚠️ الرقم مطلوب.';
    }

    final RegExp numbersOnly = RegExp(r'^\d+$');

    if (!numbersOnly.hasMatch(text)) {
      return '⚠️ يسمح بالأرقام فقط.';
    }

    return null;
  }
}