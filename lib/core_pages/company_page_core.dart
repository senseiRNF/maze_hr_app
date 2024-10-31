import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/company_display.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State createState() => CompanyCore();
}

class CompanyCore extends State<CompanyPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDisplay(core: this);
  }
}