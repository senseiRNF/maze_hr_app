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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: core.selectedWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: core.selectedMenu,
        // backgroundColor: Theme.of(context).colorScheme.secondary,
        onTap: (selectedIndex) => core.onChangeSelectedMenu(
          index: selectedIndex,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}