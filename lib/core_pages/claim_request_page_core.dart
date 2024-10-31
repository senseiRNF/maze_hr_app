import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/claim_request_display.dart';

class ClaimRequestPage extends StatefulWidget {
  const ClaimRequestPage({super.key});

  @override
  State createState() => ClaimRequestCore();
}

class ClaimRequestCore extends State<ClaimRequestPage> {
  List claimRequestList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClaimRequestDisplay(core: this);
  }
}