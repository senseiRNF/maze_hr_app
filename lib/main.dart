import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_hr_app/miscellaneous/global_variables.dart';
import 'package:maze_hr_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const RootApp());
  });
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalString.appName,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xff00afff,
          <int, Color> {
            50: Color(0xff009ee6),
            100: Color(0xff008ccc),
            200: Color(0xff007ab3),
            300: Color(0xff006999),
            400: Color(0xff005880),
            500: Color(0xff004666),
            600: Color(0xff00344c),
            700: Color(0xff002333),
            800: Color(0xff001119),
            900: Color(0xff000000),
          },
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff00afff),
          onPrimary: Colors.white,
          secondary: Color(0xffc6edff),
          onSecondary: Color(0xff00afff),
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xff00afff),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black54,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff00afff),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff00afff),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff00afff),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        fontFamily: 'Lato',
      ),
      routes: {
        '/': (BuildContext context) => const SplashScreen(),
      },
    );
  }
}