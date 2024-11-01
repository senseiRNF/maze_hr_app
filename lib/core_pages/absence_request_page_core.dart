import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/absence_request_display.dart';

class AbsenceRequestPage extends StatefulWidget {
  const AbsenceRequestPage({super.key});

  @override
  State createState() => AbsenceRequestCore();
}

class AbsenceRequestCore extends State<AbsenceRequestPage> {
  List attendanceRequestList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsenceRequestDisplay(core: this);
  }
}