import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/setting_page_core.dart';
import 'package:maze_hr_app/services/local/static_variables.dart';

class SettingDisplay extends StatelessWidget {
  final SettingCore core;

  const SettingDisplay({
    super.key,
    required this.core,
  });

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
            child: ListView.builder(
              itemCount: core.settingList.length,
              itemBuilder: (listContext, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 5.0,
                  child: InkWell(
                    onTap: () => core.settingList[index]["on_pressed"](),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            core.settingList[index]["icon"],
                            color: core.settingList[index]["icon_color"],
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              core.settingList[index]["title"],
                              style: TextStyle(
                                color: core.settingList[index]["icon_color"],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Versi: ${StaticVariables.versionNumber}',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}