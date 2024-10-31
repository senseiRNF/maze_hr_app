import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_hr_app/core_pages/splash_page_core.dart';
import 'package:maze_hr_app/services/local/static_variables.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const RootApp()));
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StaticVariables.appName,
      theme: ThemeData(
        colorScheme: StaticVariables.customColorScheme,
        inputDecorationTheme: StaticVariables.customInputDecoration,
        useMaterial3: false,
      ),
      routes: {
        '/': (BuildContext context) => const SplashPage(),
      },
    );
  }
}