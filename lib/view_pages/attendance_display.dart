import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/attendance_page_core.dart';

class AttendanceDisplay extends StatelessWidget {
  final AttendanceCore core;

  const AttendanceDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          core.widget.attendanceJson.clockInTime == null
              ? "Absen Masuk"
              : "Absen Pulang",
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => core.onInit(),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          children: [
            core.isAbleToCheckAttendance ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 35.0,
                  color: Colors.lightGreen,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Anda berada disekitar lokasi kerja",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wrong_location_rounded,
                  size: 35.0,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Anda tidak berada disekitar lokasi kerja",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Usap kebawah untuk memperbaharui lokasi",
              style: TextStyle(
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(10.0),
                image: core.attendancePhoto != null ?
                DecorationImage(
                  image: FileImage(
                    core.convertAttendancePhoto(),
                  ),
                  fit: BoxFit.cover,
                ) : null,
              ),
              child: InkWell(
                onTap: () => core.onTakingImage(),
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: core.attendancePhoto == null ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Anda sudah siap untuk mengambil gambar?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Ambil gambar sekarang",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ) :
                Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "Anda terlihat keren!!!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              core.widget.attendanceJson.clockInTime == null
                  ? "Absen Masuk"
                  : "Absen Pulang",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "${core.customDateTime.completeDayFormat()}, ${core.customDateTime.completeMonthFormat()}",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              core.customDateTime.timeOfDay(),
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: core.isAbleToCheckAttendance == true && core.attendancePhoto != null ?
              ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ) :
              ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                child: Text(
                  'Absen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}