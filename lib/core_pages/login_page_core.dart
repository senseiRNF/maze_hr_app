import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
import 'package:maze_hr_app/services/local/object/local_company_json.dart';
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

    await onGenerateDummyData().then((generateResult) {
      if(generateResult == true) {
        Future.delayed(const Duration(seconds: 3)).then((_) {
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

  Future<bool> onGenerateDummyData() async {
    bool result = false;

    await LocalSecureStorage.writeKey(
      key: LocalSecureKey.authKey,
      data: LocalAuthJson(
        userId: 1,
        email: "user.test@maze.com",
        username: "User Test",
        dob: "30 Februari 1990",
        gender: "Pria",
        address: "Desa Sukamaju, Kec. Jonggol, Kab. Bogor",
        department: "IT",
        division: "Development",
        role: "Superuser",
        avatar: "https://i.ytimg.com/vi/x5cdtS1HDq4/hqdefault.jpg?sqp=-oaymwEmCOADEOgC8quKqQMa8AEB-AH-BIAC4AOKAgwIABABGBMgTih_MA8=&rs=AOn4CLA5qFPIIcZwYOBHdUPrr3R4KYyjKg",
        companyId: 1,
      ).simplify(),
    ).then((writeAuth) async {
      if(writeAuth == true) {
        await LocalSecureStorage.writeKey(
          key: LocalSecureKey.companyKey,
          data: LocalCompanyJson(
            companyId: 1,
            companyName: "PT Maju Bangun Sejahtera",
            companyAddress: "Citra Indah City Comm Park CCP 17/01",
            companyCallCenter: "+621234567890",
            companyEmail: "majubangun.sejahtera@maze.com",
          ).simplify(),
        ).then((writeCompany) {
          if(writeCompany == true) {
            result = true;
          }
        });
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return LoginDisplay(core: this);
  }
}