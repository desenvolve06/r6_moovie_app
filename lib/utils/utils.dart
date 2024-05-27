class Utils {
  static String formatDateString(String dateString) {
    final dateParts = dateString.split('-');
    if (dateParts.length == 3) {
      final year = dateParts[0];
      final month = dateParts[1];
      final day = dateParts[2];
      return '$day-$month-$year';
    } else {
      return 'Data inválida';
    }
  }

  String removeWhitespace(String value) {
    return value.replaceAll(' ', '');
  }

  bool isValidEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
