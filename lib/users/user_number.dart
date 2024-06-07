bool isValidPhoneNumber(String phoneNumber) {
  return RegExp(r'^\+?\d{10,15}$').hasMatch(phoneNumber);
}
