import 'package:flutter/material.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
import 'package:maze_hr_app/services/local/object/local_company_json.dart';
import 'package:maze_hr_app/view_pages/company_display.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State createState() => CompanyCore();
}

class CompanyCore extends State<CompanyPage> {
  LocalAuthJson? authJson;

  LocalCompanyJson? companyJson;

  @override
  void initState() {
    super.initState();

    onInit();
  }

  onInit() async {
    await LocalSecureStorage.readKey(
      key: LocalSecureKey.authKey,
    ).then((authResult) async {
      setState(() {
        authJson = LocalAuthJson.obscure(
          source: authResult,
        );
      });

      await LocalSecureStorage.readKey(
        key: LocalSecureKey.companyKey,
      ).then((companyResult) async {
        setState(() {
          companyJson = LocalCompanyJson.obscure(
            source: companyResult,
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDisplay(core: this);
  }
}