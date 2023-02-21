import 'package:flutter/material.dart';
import 'package:maze_hr_app/screens/fragments/home_fragment.dart';
import 'package:maze_hr_app/screens/fragments/profile_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMenu = 1;

  DateTime? backPressedTime;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onBackPressed() {
    if(backPressedTime != null && DateTime.now().difference(backPressedTime!).inSeconds < 3) {
      return Future.value(true);
    } else {
      setState(() {
        backPressedTime = DateTime.now();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Tekan sekali lagi untuk menutup aplikasi',
          ),
          duration: Duration(seconds: 3),
        ),
      );

      return Future.value(false);
    }
  }

  Widget selectedWidget() {
    switch(selectedMenu) {
      case 1:
        return const HomeFragment();
      case 2:
        return const ProfileFragment();
      default:
        return const Material();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: selectedWidget(),
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenu = 1;
                      });
                    },
                    customBorder: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.home,
                        size: 30.0,
                        color: selectedMenu == 1 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenu = 2;
                      });
                    },
                    customBorder: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.person,
                        size: 30.0,
                        color: selectedMenu == 2 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}