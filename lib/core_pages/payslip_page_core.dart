import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/payslip_display.dart';

class PayslipPage extends StatefulWidget {
  const PayslipPage({super.key});

  @override
  State createState() => PayslipCore();
}

class PayslipCore extends State<PayslipPage> {
  List payslipList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PayslipDisplay(core: this);
  }
}