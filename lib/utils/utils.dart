import 'package:intl/intl.dart';
class Utils {
  
  static String formatDateToBrazilian(String dateAmerican) {
    
    DateTime parsedDate = DateTime.parse(dateAmerican);
  
    String dateBrazilian = DateFormat('dd-MM-yyyy').format(parsedDate);
  
    return dateBrazilian;
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
