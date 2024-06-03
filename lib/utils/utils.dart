// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';

class Utils {
  static String formatDateToBrazilian(String dateAmerican) {
    try {
      DateTime parsedDate = DateTime.parse(dateAmerican);

      String dateBrazilian = DateFormat('dd-MM-yyyy').format(parsedDate);

      print('Teste ${dateAmerican}');

      return dateBrazilian;
    } on FormatException {
      print('A data americana recebida está em um formato inválido.');
      print(dateAmerican);

      return '00/00/0000';
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
