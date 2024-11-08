import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/home_page_core.dart';
import 'package:maze_hr_app/services/local/custom_date_time.dart';

class HomeFragment extends StatelessWidget {
  final HomeCore core;

  const HomeFragment({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            core.authJson?.companyName ?? '(Perusahaan Tidak Diketahui)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              children: [
                Row(
                  children: [
                    core.authJson != null ?
                    CachedNetworkImage(
                      imageUrl: core.authJson?.avatar ?? "-",
                      imageBuilder: (imgContext, imgProvider) {
                        return CircleAvatar(
                          foregroundImage: imgProvider,
                          radius: 30.0,
                        );
                      },
                      errorWidget: (errContext, _, errObj) {
                        return CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          radius: 30.0,
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      },
                    ) :
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 30.0,
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            core.authJson?.username ?? "(Karyawan Tidak Diketahui)",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            core.authJson?.role ?? '(Jabatan Tidak Diketahui)',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "${core.customDateTime.completeDayFormat()}, ${core.customDateTime.shortMonthFormat()}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red[300],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Lokasi Kerja Hari Ini",
                                  ),
                                  Text(
                                    core.authJson?.companyAddress ?? '(Lokasi Tidak Diketahui)',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Absen Masuk",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      core.todayAttendance?.clockInTime ?? "--:--",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Absen Pulang",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      core.todayAttendance?.clockOutTime ?? "--:--",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => core.onAttendancePressed(),
                          child: Text(
                            "Isi Absensi",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Pintasan Menu",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => core.onChangeShortcut(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Text(
                              "Ubah",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Builder(
                    builder: (context) {
                      List<Map<String, dynamic>> shortcutListed = [];

                      for(int i = 0; i < core.homeMenuList.length; i++) {
                        if(core.homeMenuList[i]["shortcut"] == true) {
                          shortcutListed.add(core.homeMenuList[i]);
                        }
                      }

                      return shortcutListed.isNotEmpty ?
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5.0,
                          crossAxisCount: 3,
                          childAspectRatio: 1/0.8,
                        ),
                        itemCount: shortcutListed.length,
                        itemBuilder: (gridContext, index) {
                          return Card(
                            elevation: 5.0,
                            child: InkWell(
                              onTap: () => shortcutListed[index]["on_pressed"](),
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
                                      color: shortcutListed[index]["icon_color"] != null
                                          ? shortcutListed[index]["icon_color"].withOpacity(0.2)
                                          : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      shortcutListed[index]["icon"],
                                      color: shortcutListed[index]["icon_color"] ?? Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    shortcutListed[index]["title"],
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ) :
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          "Pintasan Belum Ditambahkan",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Informasi Seputar Kerja",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        core.infoJson.title ?? "(Tidak Ada Judul)",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1.0,
                      ),
                      Text(
                        core.infoJson.content ?? "",
                      ),
                      const Divider(
                        color: Colors.black38,
                        thickness: 1.0,
                      ),
                      Text(
                        "Diposting oleh:"
                      ),
                      Text(
                        core.infoJson.publishedBy ?? "(-)",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        core.infoJson.datePublished != null ?
                        CustomDateTime(
                          dateTime: DateTime.parse(core.infoJson.datePublished!),
                        ).fullNumericFormat() :
                        "",
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}