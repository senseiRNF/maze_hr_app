import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/absence_report_display.dart';

class AbsenceReportPage extends StatefulWidget {
  const AbsenceReportPage({super.key});

  @override
  State createState() => AbsenceReportCore();
}

class AbsenceReportCore extends State<AbsenceReportPage> {
  List attendanceReportList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsenceReportDisplay(core: this);
  }
}