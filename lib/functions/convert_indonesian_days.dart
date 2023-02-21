import 'package:intl/intl.dart';

class ConvertIndonesianDays {
  static String completeDayDateMonthYear(DateTime dateTime) {
    String dayName;
    String monthName;

    switch(dateTime.weekday) {
      case 1:
        dayName = 'Senin';
        break;
      case 2:
        dayName = 'Selasa';
        break;
      case 3:
        dayName = 'Rabu';
        break;
      case 4:
        dayName = 'Kamis';
        break;
      case 5:
        dayName = 'Jumat';
        break;
      case 6:
        dayName = 'Sabtu';
        break;
      case 7:
        dayName = 'Minggu';
        break;
      default:
        dayName = '-';
        break;
    }

    switch(dateTime.month) {
      case 1:
        monthName = 'Januari';
        break;
      case 2:
        monthName = 'Februari';
        break;
      case 3:
        monthName = 'Maret';
        break;
      case 4:
        monthName = 'April';
        break;
      case 5:
        monthName = 'Mei';
        break;
      case 6:
        monthName = 'Juni';
        break;
      case 7:
        monthName = 'Juli';
        break;
      case 8:
        monthName = 'Agustus';
        break;
      case 9:
        monthName = 'September';
        break;
      case 10:
        monthName = 'Oktober';
        break;
      case 11:
        monthName = 'November';
        break;
      case 12:
        monthName = 'Desember';
        break;
      default:
        monthName = '-';
        break;
    }

    return '$dayName, ${DateFormat('dd').format(dateTime)} $monthName ${DateFormat('yyyy').format(dateTime)}';
  }

  static String shortDayDateMonthYear(DateTime dateTime) {
    String dayName;
    String monthName;

    switch(dateTime.weekday) {
      case 1:
        dayName = 'Sen';
        break;
      case 2:
        dayName = 'Sel';
        break;
      case 3:
        dayName = 'Rab';
        break;
      case 4:
        dayName = 'Kam';
        break;
      case 5:
        dayName = 'Jum';
        break;
      case 6:
        dayName = 'Sab';
        break;
      case 7:
        dayName = 'Min';
        break;
      default:
        dayName = '-';
        break;
    }

    switch(dateTime.month) {
      case 1:
        monthName = 'Jan';
        break;
      case 2:
        monthName = 'Feb';
        break;
      case 3:
        monthName = 'Mar';
        break;
      case 4:
        monthName = 'Apr';
        break;
      case 5:
        monthName = 'Mei';
        break;
      case 6:
        monthName = 'Jun';
        break;
      case 7:
        monthName = 'Jul';
        break;
      case 8:
        monthName = 'Aug';
        break;
      case 9:
        monthName = 'Sep';
        break;
      case 10:
        monthName = 'Okt';
        break;
      case 11:
        monthName = 'Nov';
        break;
      case 12:
        monthName = 'Des';
        break;
      default:
        monthName = '-';
        break;
    }

    return '$dayName, ${DateFormat('dd').format(dateTime)} $monthName ${DateFormat('yyyy').format(dateTime)}';
  }
}