import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/help_page_core.dart';

class HelpDisplay extends StatelessWidget {
  final HelpCore core;

  const HelpDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pusat Bantuan',
        ),
      ),
      body: ListView(),
    );
  }
}