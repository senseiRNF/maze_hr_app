import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maze_hr_app/core_pages/absence_page_core.dart';
import 'package:maze_hr_app/core_pages/attendance_page_core.dart';
import 'package:maze_hr_app/core_pages/claim_page_core.dart';
import 'package:maze_hr_app/core_pages/company_page_core.dart';
import 'package:maze_hr_app/core_pages/payslip_page_core.dart';
import 'package:maze_hr_app/core_pages/report_page_core.dart';
import 'package:maze_hr_app/core_pages/setting_page_core.dart';
import 'package:maze_hr_app/services/local/custom_date_time.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_attendance_json.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
import 'package:maze_hr_app/services/local/object/local_info_json.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/fragments/home_fragment.dart';
import 'package:maze_hr_app/view_pages/fragments/profile_fragment.dart';
import 'package:maze_hr_app/view_pages/home_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomeCore();
}

class HomeCore extends State<HomePage> {
  LocalAuthJson? authJson;

  LocalAttendanceJson? todayAttendance;

  LocalInfoJson infoJson = LocalInfoJson(
    title: "Himbauan Direktur Operasional",
    datePublished: "2024-10-28",
    content: "Mohon perhatian,\n\nSehubungan dengan tingginya tingkat permintaan produksi di tahun 2025, "
        "maka dihimbau kepada pelaku kegiatan operasional untuk tetap selalu menjaga kesehatan dan tidak"
        "bekerja secara berlebihan.\n\nMari kita jaga kesehatan bersama.",
    publishedBy: "Monkey D. Uzumaki",
    department: "Operasional",
  );

  int selectedMenu = 0;

  List<Map<String, dynamic>> homeMenuList = [];
  List<Map<String, dynamic>> profileList = [];

  CustomDateTime customDateTime = CustomDateTime(
    dateTime: DateTime.now(),
  );

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

        homeMenuList = [
          {
            "title": "Kehadiran",
            "icon": Icons.share_arrival_time,
            "icon_color": null,
            "shortcut": false,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const AbsencePage(),
            ),
          },
          {
            "title": "Klaim",
            "icon": Icons.attach_money,
            "icon_color": null,
            "shortcut": false,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const ClaimPage(),
            ),
          },
          {
            "title": "Slip Gaji",
            "icon": Icons.receipt_long,
            "icon_color": Colors.deepOrange,
            "shortcut": false,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const PayslipPage(),
            ),
          },
          {
            "title": "Perusahaan",
            "icon": Icons.home_work,
            "icon_color": Colors.amber,
            "shortcut": false,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const CompanyPage(),
            ),
          },
          {
            "title": "Laporan",
            "icon": Icons.list_alt,
            "icon_color": Colors.deepOrange,
            "shortcut": false,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const ReportPage(),
            ),
          },
        ];

        if(authJson != null && authJson!.shortcutMenu != null) {
          for(int i = 0; i < authJson!.shortcutMenu!.length; i++) {
            for(int a = 0; a < homeMenuList.length; a++) {
              if(authJson!.shortcutMenu![i] == a) {
                homeMenuList[a]["shortcut"] = true;
              }
            }
          }
        }

        profileList = [
          {
            "title": "Tanggal Lahir",
            "body": authJson?.dob ?? '(Tanggal Lahir Tidak Diketahui)',
          },
          {
            "title": "Jenis Kelamin",
            "body": authJson?.gender ?? '(Jenis Kelamin Tidak Diketahui)',
          },
          {
            "title": "Alamat",
            "body": authJson?.address ?? '(Alamat Tidak Diketahui)',
          },
          {
            "title": "Department",
            "body": authJson?.department ?? '(Department Tidak Diketahui)',
          },
          {
            "title": "Divisi",
            "body": authJson?.division ?? '(Divisi Tidak Diketahui)',
          },
        ];
      });

      await LocalSecureStorage.readKey(
        key: LocalSecureKey.attendanceKey,
      ).then((attendanceResult) {
        LocalAttendanceJson? todayAttendanceResult;

        List<LocalAttendanceJson> attendanceList = LocalAttendanceJson.obscureList(
          source: attendanceResult,
        );

        for(int i = 0; i < attendanceList.length; i++) {
          if(attendanceList[i].dateAttendance == DateFormat("yyyy-MM-dd").format(DateTime.now())) {
            todayAttendanceResult = attendanceList[i];
          }
        }

        setState(() {
          todayAttendance = todayAttendanceResult;
        });
      });
    });
  }

  Widget selectedWidget() {
    switch(selectedMenu) {
      case 0:
        return HomeFragment(
          core: this,
        );
      case 2:
        return ProfileFragment(
          core: this,
        );
      default:
        return const Material();
    }
  }

  onChangeSelectedMenu({required int index}) => setState(() {
    selectedMenu = index;
  });

  onSettingPressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: const SettingPage(),
  );

  onShowAllMenu() => showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (mbsContext) {
      return StatefulBuilder(
        builder: (sbContext, StateSetter bsState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5.0,
              crossAxisCount: 3,
              childAspectRatio: 1/0.8,
            ),
            itemCount: homeMenuList.length,
            itemBuilder: (gridContext, index) {
              return Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: () => RouteFunctions(
                    context: context,
                  ).closeBack(
                    callbackResult: index,
                  ),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: homeMenuList[index]["icon_color"] != null
                              ? homeMenuList[index]["icon_color"].withOpacity(0.2)
                              : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          homeMenuList[index]["icon"],
                          color: homeMenuList[index]["icon_color"] ?? Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        homeMenuList[index]["title"],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  ).then((bsResult) {
    if(bsResult != null) {
      homeMenuList[bsResult]["on_pressed"]();
    }
  });

  onAttendancePressed() => RouteFunctions(
    context: context,
  ).moveTo(
    target: AttendancePage(
      attendanceJson: todayAttendance ?? LocalAttendanceJson(),
    ),
    callbackFunction: (callbackResult) => onInit(),
  );

  onChangeShortcut() {
    List<Map<String, dynamic>> bsHomeMenuList = homeMenuList;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (mbsContext) {
        return StatefulBuilder(
          builder: (sbContext, StateSetter bsState) {
            changeShortcut({
              required int index,
              required bool active,
            }) {
              if(active == false) {
                int shortcutTotal = 0;

                for(int i = 0; i < homeMenuList.length; i++) {
                  if(homeMenuList[i]["shortcut"] == true) {
                    shortcutTotal = shortcutTotal + 1;

                    if(shortcutTotal == 3) {
                      break;
                    }
                  }
                }

                if(shortcutTotal < 3) {
                  setState(() {
                    homeMenuList[index]["shortcut"] = true;
                  });

                  bsState(() {
                    bsHomeMenuList[index]["shortcut"] = true;
                  });
                } else {
                  DialogFunctions(
                    context: context,
                  ).okDialog(
                    icon: Icons.error,
                    iconColor: Colors.red,
                    message: "Pintasan yang dapat dipilih maksimal 3 menu",
                  );
                }
              } else {
                setState(() {
                  homeMenuList[index]["shortcut"] = false;
                });

                bsState(() {
                  bsHomeMenuList[index]["shortcut"] = false;
                });
              }
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.0,
                crossAxisCount: 3,
                childAspectRatio: 1/0.8,
              ),
              itemCount: bsHomeMenuList.length,
              itemBuilder: (gridContext, index) {
                return Card(
                  elevation: 5.0,
                  child: InkWell(
                    onTap: () => changeShortcut(
                      index: index,
                      active: bsHomeMenuList[index]["shortcut"],
                    ),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Stack(
                      children: [
                        bsHomeMenuList[index]["shortcut"] == true ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ],
                        ) :
                        const Material(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: bsHomeMenuList[index]["icon_color"] != null
                                    ? bsHomeMenuList[index]["icon_color"].withOpacity(0.2)
                                    : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                bsHomeMenuList[index]["icon"],
                                color: bsHomeMenuList[index]["icon_color"] ?? Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              bsHomeMenuList[index]["title"],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    ).then((bsResult) async {
      List<int> selectedShortcut = [];

      for(int i = 0; i < homeMenuList.length; i++) {
        if(homeMenuList[i]["shortcut"] == true) {
          selectedShortcut.add(i);
        }
      }

      LocalAuthJson overwriteAuth = authJson ?? LocalAuthJson();

      overwriteAuth.shortcutMenu = selectedShortcut;

      await LocalSecureStorage.writeKey(
        key: LocalSecureKey.authKey,
        data: overwriteAuth.simplify(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeDisplay(core: this);
  }
}