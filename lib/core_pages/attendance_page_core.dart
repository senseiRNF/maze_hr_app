import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/attendance_form_page_core.dart';
import 'package:maze_hr_app/core_pages/attendance_report_page_core.dart';
import 'package:maze_hr_app/core_pages/attendance_request_page_core.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/attendance_display.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State createState() => AttendanceCore();
}

class AttendanceCore extends State<AttendancePage> {

  @override
  void initState() {
    super.initState();
  }

  onRequestAbsencePressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AttendanceFormPage(),
  );

  onAbsenceRequestReportPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AttendanceRequestPage(),
  );

  onAbsenceReportPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AttendanceReportPage(),
  );

  @override
  Widget build(BuildContext context) {
    return AttendanceDisplay(core: this);
  }
}