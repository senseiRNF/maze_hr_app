import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';

class ProfileFragment extends StatelessWidget {
  final HomeCore core;

  const ProfileFragment({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profil',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () => core.onSettingPressed(),
                      customBorder: const CircleBorder(),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.settings,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 100.0,
                ),
              ),
              Text(
                core.authJson?.username ?? '(Karyawan Tidak Diketahui)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                core.authJson?.role ?? '(Jabatan Tidak Diketahui)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            separatorBuilder: (separatorContext, separatorIndex) {
              return const SizedBox(
                height: 15.0,
              );
            },
            itemCount: core.profileList.length,
            itemBuilder: (listContext, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    core.profileList[index]["title"],
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    core.profileList[index]["body"],
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}