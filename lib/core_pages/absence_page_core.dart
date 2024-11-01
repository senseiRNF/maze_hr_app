import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/absence_form_page_core.dart';
import 'package:maze_hr_app/core_pages/absence_report_page_core.dart';
import 'package:maze_hr_app/core_pages/absence_request_page_core.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/absence_display.dart';

class AbsencePage extends StatefulWidget {
  const AbsencePage({super.key});

  @override
  State createState() => AbsenceCore();
}

class AbsenceCore extends State<AbsencePage> {

  @override
  void initState() {
    super.initState();
  }

  onRequestAbsencePressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AbsenceFormPage(),
  );

  onAbsenceRequestReportPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AbsenceRequestPage(),
  );

  onAbsenceReportPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const AbsenceReportPage(),
  );

  @override
  Widget build(BuildContext context) {
    return AbsenceDisplay(core: this);
  }
}