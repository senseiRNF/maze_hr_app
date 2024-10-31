import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/report_display.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State createState() => ReportCore();
}

class ReportCore extends State<ReportPage> {
  List reportList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReportDisplay(core: this);
  }
}