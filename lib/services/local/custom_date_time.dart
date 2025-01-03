import 'package:intl/intl.dart';

/// Custom Date Time
///
/// This class serve as an easy function to convert any date time data into string with format
class CustomDateTime {
  DateTime dateTime;

  CustomDateTime({
    required this.dateTime,
  });

  /// Full Numerical Format
  ///
  /// This function return on format dd-MM-yyyy
  String fullNumericFormat() {
    return DateFormat("dd-MM-yyyy").format(dateTime);
  }

  /// Short Month Format
  ///
  /// This function return on format dd MMM yyyy
  String shortMonthFormat() {
    String monthName;

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

    return "${dateTime.day} $monthName ${dateTime.year}";
  }

  /// Complete Month Format
  ///
  /// This function return on format dd MMMM yyyy
  String completeMonthFormat() {
    String monthName;

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

    return "${dateTime.day} $monthName ${dateTime.year}";
  }

  /// Short Day Format
  ///
  /// This function return on format EEE
  String shortDayFormat() {
    switch(dateTime.weekday) {
      case 1:
        return "Sen";
      case 2:
        return "Sel";
      case 3:
        return "Rab";
      case 4:
        return "Kam";
      case 5:
        return "Jum";
      case 6:
        return "Sab";
      case 7:
        return "Min";
      default:
        return "";
    }
  }

  /// Complete Day Format
  ///
  /// This function return on format EEEE
  String completeDayFormat() {
    switch(dateTime.weekday) {
      case 1:
        return "Senin";
      case 2:
        return "Selasa";
      case 3:
        return "Rabu";
      case 4:
        return "Kamis";
      case 5:
        return "Jumat";
      case 6:
        return "Sabtu";
      case 7:
        return "Minggu";
      default:
        return "";
    }
  }

  String timeOfDay() => DateFormat("HH:mm").format(dateTime);
}