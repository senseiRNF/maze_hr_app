import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_hr_app/services/local/custom_date_time.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/local_secure_storage.dart';
import 'package:maze_hr_app/services/local/object/local_attendance_json.dart';
import 'package:maze_hr_app/services/local/object/local_auth_json.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/attendance_display.dart';

class AttendancePage extends StatefulWidget {
  final LocalAttendanceJson attendanceJson;

  const AttendancePage({
    super.key,
    required this.attendanceJson,
  });

  @override
  State createState() => AttendanceCore();
}

class AttendanceCore extends State<AttendancePage> {
  LocalAuthJson? authJson;

  bool isAbleToCheckAttendance = false;

  XFile? attendancePhoto;

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
      });
    });

    onCheckIfLocationReached().then((result) {
      setState(() {
        isAbleToCheckAttendance = result;
      });
    });
  }

  Future<Position?> onDeterminePosition() async {
    Position? result;

    await Geolocator.isLocationServiceEnabled().then((locationService) async {
      if(locationService == true) {
        await Geolocator.checkPermission().then((permission) async {
          if(permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
            if(mounted) {
              DialogFunctions(
                context: context,
              ).loadingDialog();
            }

            await Geolocator.getCurrentPosition(
              locationSettings: LocationSettings(
                accuracy: LocationAccuracy.best,
              ),
            ).then((currentLocation) {
              result = currentLocation;

              if(mounted) {
                RouteFunctions(
                  context: context,
                ).closeBack();
              }
            });
          } else {
            await Geolocator.requestPermission().then((newPermission) async {
              if(newPermission == LocationPermission.always || newPermission == LocationPermission.whileInUse) {
                if(mounted) {
                  DialogFunctions(
                    context: context,
                  ).loadingDialog();
                }

                await Geolocator.getCurrentPosition(
                  locationSettings: LocationSettings(
                    accuracy: LocationAccuracy.best,
                  ),
                ).then((currentLocation) {
                  result = currentLocation;

                  if(mounted) {
                    RouteFunctions(
                      context: context,
                    ).closeBack();
                  }
                });
              } else {
                if(mounted) {
                  DialogFunctions(
                    context: context,
                  ).okDialog(
                    icon: Icons.error,
                    iconColor: Colors.red,
                    message: "Tidak dapat mengakses lokasi karena izin tidak diberikan",
                    onClose: () => RouteFunctions(
                      context: context,
                    ).closeBack(),
                  );
                }
              }
            });
          }
        });
      }
    });

    return result;
  }

  Future<bool> onCheckIfLocationReached() async {
    bool result = false;

    // double? workplaceLat = authJson != null && authJson!.pointLatitude != null
    //     ? double.parse(authJson!.pointLatitude!)
    //     : null;
    // double? workplaceLon = authJson != null && authJson!.pointLongitude != null
    //     ? double.parse(authJson!.pointLongitude!)
    //     : null;

    /// Lokasi: Kirana 2 Tower, Kelapa Gading
    double? workplaceLat = -6.165442227702872;
    double? workplaceLon = 106.91416480217725;

    await onDeterminePosition().then((position) {
      double? distanceInMeter;

      if(position != null && workplaceLat != null && workplaceLon != null) {
        distanceInMeter = Geolocator.distanceBetween(
          workplaceLat,
          workplaceLon,
          position.latitude,
          position.longitude,
        );
      }

      if(distanceInMeter != null) {
        int roundedDistance = distanceInMeter.round();

        if(roundedDistance < 500) {
          result = true;
        } else {
          if(mounted) {
            DialogFunctions(
              context: context,
            ).okDialog(
              icon: Icons.error,
              iconColor: Colors.red,
              message: "Anda berada diluar area jangkauan untuk melakukan absen",
            );
          }
        }
      } else {
        if(mounted) {
          DialogFunctions(
            context: context,
          ).okDialog(
            icon: Icons.error,
            iconColor: Colors.red,
            message: "Terdapat kesalahan saat mengambil lokasi saat ini, silahkan coba lagi...",
            onClose: () => RouteFunctions(
              context: context,
            ).closeBack(),
          );
        }
      }
    });

    return result;
  }

  onTakingImage() async {
    await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    ).then((imageResult) => imageResult != null ? setState(() {
      attendancePhoto = imageResult;
    }) : {});
  }

  File convertAttendancePhoto() => File(attendancePhoto!.path);

  @override
  Widget build(BuildContext context) {
    return AttendanceDisplay(core: this);
  }
}