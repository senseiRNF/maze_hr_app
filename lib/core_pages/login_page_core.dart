import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/login_display.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => LoginCore();
}

class LoginCore extends State<LoginPage> {
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController();

  bool isObscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  onLogin() async {
    DialogFunctions(
      context: context,
    ).loadingDialog();

    await LocalSecureStorage.writeKey(
      key: LocalSecureKey.authKey,
      data: LocalAuthJson(
        userId: 0,
        email: emailCTRL.text != ""
            ? emailCTRL.text
            : "user.test@maze.com",
        username: "User Test",
        dob: "30 Februari 1990",
        gender: "Pria",
        address: "Desa Sukamakmur, Kec. Sukamakmur, Kab. Bogor",
        department: "Research & Development",
        division: "Information Technology",
        role: "Superuser",
        companyName: "PT Maju Mundur Sejahtera",
        companyAddress: "Citra Indah City Park",
        pointLatitude: "-6.483641011972485",
        pointLongitude: "107.03685364541674",
      ).simplify(),
    ).then((writeResult) {
      if(writeResult == true) {
        Future.delayed(const Duration(seconds: 5)).then((_) {
          if(mounted) {
            RouteFunctions(
              context: context,
            ).closeBack();

            RouteFunctions(
              context: context,
            ).replaceWith(
              target: const HomePage(),
            );
          }
        });
      }
    });
  }

  onObscurityPressed() => setState(() {
    isObscurePassword = !isObscurePassword;
  });

  onForgotPasswordPressed() => DialogFunctions(
    context: context,
  ).okDialog(
    message: "Fitur belum tersedia untuk saat ini",
    icon: Icons.update,
    iconColor: Colors.amber,
  );

  @override
  Widget build(BuildContext context) {
    return LoginDisplay(core: this);
  }
}