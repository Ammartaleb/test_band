import 'package:test_band/features/auth/domain/entities/gender_entity.dart';
import 'package:test_band/features/auth/domain/entities/governorate_entity.dart';
import 'package:test_band/features/auth/domain/entities/grade_entity.dart';

class AppValidators {
  String? validatePhoneNumberInputField({required String? input}) {
    if (input == null || input.isEmpty) {
      return "رقم الهاتف مطلوب";
    }
    if (input.length < 14) {
      return "رقم الهاتف يجب أن يحتوي على 14 أرقام على الأقل";
    }
    if (!input.startsWith("+964")) {
      return "يجب أن يبدأ رقم الهاتف بـ +964";
    }
    return null;
  }

  String? validatePassword({required String? input}) {
    if (input == null || input.isEmpty) {
      return "كلمة المرور مطلوبة";
    } else if (input.length < 8) {
      return "كلمة المرور يجب أن تتكون من 8 أحرف على الأقل";
    } else {
      return null;
    }
  }

  String? validateFirstNameInputField({required String? input}) {
    if (input == null || input.isEmpty) {
      return "الاسم الأول مطلوب";
    }
    return null;
  }

  String? validateLastNameInputField({required String? input}) {
    if (input == null || input.isEmpty) {
      return "اسم العائلة مطلوب";
    }
    return null;
  }

  String? validateGovernorateField({required GovernorateEntity? input}) {
    if (input == null) {
      return "يرجى اختيار المحافظة";
    }
    return null;
  }

  String? validateBirthDateInputField({required String? input}) {
    if (input == null || input.isEmpty) {
      return "تاريخ الميلاد مطلوب";
    }
    return null;
  }

  String? validateEducationalGradeField({required GradeEntity? input}) {
    if (input == null) {
      return "يرجى اختيار المرحلة الدراسية";
    }
    return null;
  }

  String? validateGenderField({required GenderEntity? input}) {
    if (input == null) {
      return "يرجى اختيار الجنس";
    }
    return null;
  }

  String? validateRePassword({
    required String? password,
    required String? rePassword,
  }) {
    if (rePassword == null || rePassword.isEmpty) {
      return "يرجى تأكيد كلمة المرور";
    } else if (password != rePassword) {
      return "كلمتا المرور غير متطابقتين";
    }
    return null;
  }
}
