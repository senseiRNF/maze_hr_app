import 'package:flutter/material.dart';
import 'package:maze_hr_app/view_pages/help_display.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State createState() => HelpCore();
}

class HelpCore extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelpDisplay(core: this);
  }
}