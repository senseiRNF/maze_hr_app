import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/splash_page_core.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/setting_display.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State createState() => SettingCore();
}

class SettingCore extends State<SettingPage> {
  List<Map<String, dynamic>> settingList = [];

  @override
  void initState() {
    super.initState();

    onInit();
  }

  onInit() {
    setState(() {
      settingList = [
        {
          "title": "Ubah Data Profil",
          "icon": Icons.manage_accounts,
          "icon_color": null,
          "on_pressed": () => {},
        },
        {
          "title": "Pusat Bantuan",
          "icon": Icons.help,
          "icon_color": null,
          "on_pressed": () => {},
        },
        {
          "title": "Keluar dari Sesi",
          "icon": Icons.exit_to_app,
          "icon_color": Colors.red,
          "on_pressed": () => onLogoutPressed(),
        },
      ];
    });
  }

  onLogoutPressed() => DialogFunctions(
    context: context,
  ).yesOrNoDialog(
    message: "Logout dari sesi saat ini, Anda yakin?",
    yesFunction: () async {
      await LocalSecureStorage.clearKey().then((clearResult) {
        if(clearResult == true && mounted) {
          RouteFunctions(
            context: context,
          ).redirectTo(
            target: const SplashPage(),
          );
        }
      });
    },
  );

  @override
  Widget build(BuildContext context) {
    return SettingDisplay(core: this);
  }
}