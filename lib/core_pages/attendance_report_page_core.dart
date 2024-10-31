import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/attendance_report_display.dart';

class AttendanceReportPage extends StatefulWidget {
  const AttendanceReportPage({super.key});

  @override
  State createState() => AttendanceReportCore();
}

class AttendanceReportCore extends State<AttendanceReportPage> {
  List attendanceReportList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AttendanceReportDisplay(core: this);
  }
}