import 'package:intl/intl.dart';

class HumanFormats{

  static String number(double number){
    final formattedNumber = NumberFormat.compactCurrency(
        decimalDigits: 0,
        symbol: '',
        locale: 'en'
    ).format(number);

    return formattedNumber;
  }

  static String timeToString(int number){
    int hours = 0;
    int remainingMinutes=0;

    hours = (number ~/ 60);
    remainingMinutes = (number % 60);

    return hours == 0 ?"${remainingMinutes}m" : "${hours}h $remainingMinutes'";

  }

}