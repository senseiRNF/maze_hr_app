import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/attendance_request_display.dart';

class AttendanceRequestPage extends StatefulWidget {
  const AttendanceRequestPage({super.key});

  @override
  State createState() => AttendanceRequestCore();
}

class AttendanceRequestCore extends State<AttendanceRequestPage> {
  List attendanceRequestList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AttendanceRequestDisplay(core: this);
  }
}