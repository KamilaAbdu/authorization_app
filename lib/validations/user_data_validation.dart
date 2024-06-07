import '../users/user_number.dart';
import '../users/user_password.dart';

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Введите номер телефона';
  }
  if (!isValidPhoneNumber(value)) {
    return 'Введите корректный номер телефона';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Введите пароль';
  }
  if (!isValidPassword(value)) {
    return 'Пароль должен содержать более 6 символов';
  }
  return null;
}
