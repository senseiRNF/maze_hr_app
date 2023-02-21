import 'package:flutter/material.dart';
import 'package:maze_hr_app/functions/dialog_functions.dart';
import 'package:maze_hr_app/functions/route_functions.dart';
import 'package:maze_hr_app/miscellaneous/global_variables.dart';
import 'package:maze_hr_app/screens/help_screen.dart';
import 'package:maze_hr_app/screens/splash_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.manage_accounts,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Text(
                              'Ubah Data Profil',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () => MoveTo(context: context, target: const HelpScreen()).go(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.help,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Text(
                              'Pusat Bantuan',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      OptionDialog(
                        context: context,
                        message: 'Logout dari sesi saat ini, Anda yakin?',
                        yesFunction: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext target) => const SplashScreen()), (route) => false);
                        },
                        noFunction: () {},
                      ).show();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Text(
                              'Logout Sesi',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Versi: ${GlobalString.versionNumber}',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}