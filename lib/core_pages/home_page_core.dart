import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/attendance_page_core.dart';
import 'package:maze_hr_app/core_pages/claim_page_core.dart';
import 'package:maze_hr_app/core_pages/company_page_core.dart';
import 'package:maze_hr_app/core_pages/payslip_page_core.dart';
import 'package:maze_hr_app/core_pages/report_page_core.dart';
import 'package:maze_hr_app/core_pages/setting_page_core.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
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

  int selectedMenu = 1;

  List<Map<String, dynamic>> homeMenuList = [];

  List<Map<String, dynamic>> profileList = [];

  @override
  void initState() {
    super.initState();

    onInit();
  }

  onInit() async {
    await LocalSecureStorage.readKey(
      key: LocalSecureKey.authKey,
    ).then((authResult) {
      setState(() {
        authJson = LocalAuthJson.obscure(
          source: authResult,
        );

        homeMenuList = [
          {
            "title": "Kehadiran",
            "icon": Icons.share_arrival_time,
            "icon_color": null,
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const AttendancePage(),
            ),
          },
          {
            "title": "Klaim",
            "icon": Icons.attach_money,
            "icon_color": null,
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
            "on_pressed": () => RouteFunctions(
              context: context,
            ).moveTo(
              target: const ReportPage(),
            ),
          },
        ];

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
    });
  }

  Widget selectedWidget() {
    switch(selectedMenu) {
      case 1:
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

  @override
  Widget build(BuildContext context) {
    return HomeDisplay(core: this);
  }
}