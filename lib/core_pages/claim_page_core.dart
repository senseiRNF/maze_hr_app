import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/claim_form_page_core.dart';
import 'package:maze_hr_app/core_pages/claim_request_page_core.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/claim_display.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

  @override
  State createState() => ClaimCore();
}

class ClaimCore extends State<ClaimPage> {

  @override
  void initState() {
    super.initState();
  }

  onRequestClaimPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const ClaimFormPage(),
  );

  onClaimReportPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const ClaimRequestPage(),
  );

  @override
  Widget build(BuildContext context) {
    return ClaimDisplay(core: this);
  }
}