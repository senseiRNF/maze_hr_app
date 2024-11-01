import 'dart:convert';

class LocalAttendanceJson {
  String? dateAttendance;
  String? clockInTime;
  String? clockOutTime;

  LocalAttendanceJson({
    this.dateAttendance,
    this.clockInTime,
    this.clockOutTime,
  });

  String simplify() => jsonEncode({
    "date_attendance": dateAttendance,
    "clock_in_time": clockInTime,
    "clock_out_time": clockOutTime,
  });

  static String? simplifyList({
    required List<LocalAttendanceJson> listData,
  }) {
    String? result;

    List convertedData = [];

    for(int i = 0; i < listData.length; i++) {
      convertedData.add(
        jsonEncode({
          "date_attendance": listData[i].dateAttendance,
          "clock_in_time": listData[i].clockInTime,
          "clock_out_time": listData[i].clockOutTime,
        }),
      );
    }

    if(convertedData.isNotEmpty) {
      result = jsonEncode({
        "attendance_list": convertedData,
      });
    }

    return result;
  }

  static LocalAttendanceJson obscure({String? source}) {
    LocalAttendanceJson result = LocalAttendanceJson();

    if(source != null) {
      Map<String, dynamic> data = jsonDecode(source);

      result = LocalAttendanceJson(
        dateAttendance: data["date_attendance"],
        clockInTime: data["clock_in_time"],
        clockOutTime: data["clock_out_time"],
      );
    }

    return result;
  }

  static List<LocalAttendanceJson> obscureList({String? source}) {
    List<LocalAttendanceJson> result = [];

    if(source != null) {
      Map<String, dynamic> data = jsonDecode(source);

      List convertedData = data["attendance_list"] ?? [];

      for(int i = 0; i < convertedData.length; i++) {
        result.add(
          LocalAttendanceJson(
            dateAttendance: convertedData[i]["date_attendance"],
            clockInTime: convertedData[i]["clock_in_time"],
            clockOutTime: convertedData[i]["clock_out_time"],
          ),
        );
      }
    }

    return result;
  }
}