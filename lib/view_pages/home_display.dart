import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';

class HomeDisplay extends StatelessWidget {
  final HomeCore core;

  const HomeDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: core.selectedWidget(),
            ),
            const Divider(
              color: Colors.black54,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => core.onChangeSelectedMenu(index: 1),
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.home,
                      size: 30.0,
                      color: core.selectedMenu == 1
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => core.onChangeSelectedMenu(index: 2),
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.person,
                      size: 30.0,
                      color: core.selectedMenu == 2
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}