import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';
import 'package:maze_hr_app/core_pages/login_page_core.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/splash_display.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State createState() => SplashCore();
}

class SplashCore extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    onInit();
  }

  onInit() async {
    await LocalSecureStorage.readKey(
      key: LocalSecureKey.authKey,
    ).then((auth) {
      Future.delayed(
        const Duration(seconds: 3),
      ).then((_) {
        if(mounted) {
          RouteFunctions(context: context).replaceWith(
            target: auth != null
                ? const HomePage()
                : const LoginPage(),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashDisplay(core: this);
  }
}