import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maze_hr_app/screens/splash_screen.dart';
import 'package:maze_hr_app/services/local_services/local_secure_storage.dart';

class OkDialog {
  BuildContext context;
  String message;
  Function? okFunction;
  bool? showIcon;

  OkDialog({
    required this.context,
    required this.message,
    this.okFunction,
    this.showIcon,
  });

  void show() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Perhatian',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showIcon != null ?
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0,),
                child: showIcon == true ?
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60.0,
                ) :
                const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 60.0,
                ),
              ) :
              const Material(),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    ).then((_) {
      if(okFunction != null) {
        okFunction!();
      }
    });
  }
}

class OptionDialog {
  BuildContext context;
  String message;
  Function yesFunction;
  Function noFunction;

  OptionDialog({
    required this.context,
    required this.message,
    required this.yesFunction,
    required this.noFunction,
  });

  void show() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Perhatian',
          ),
          content: Text(
            message,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                noFunction();
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                yesFunction();
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

class LoadingDialog {
  BuildContext context;

  LoadingDialog({
    required this.context,
  });

  void show() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sedang memuat, mohon tunggu...',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
  }
}

class ErrorHandler {
  BuildContext context;
  DioError dioErr;

  ErrorHandler({
    required this.context,
    required this.dioErr,
  });

  void show() {
    int? errCode;
    String? errMessage;

    if(dioErr.response != null) {
      errCode = dioErr.response!.statusCode;

      switch(errCode) {
        case 401:
          errMessage = '(401) Tidak memiliki akses. Silahkan coba lagi!';
          break;
        case 404:
          errMessage = '(404) Permintaan tidak ditemukan. Untuk informasi lebih lanjut, mohon hubungi pihak administrasi!';
          break;
        case 422:
          String? additionalMessage;

          if(dioErr.response!.data != null) {
            additionalMessage = dioErr.response!.data!['message'];
          }

          errMessage = '(422) Input permintaan salah. ${additionalMessage != null ? '\n\n$additionalMessage\n\n' : ''}Mohon periksa kembali semua data dan coba lagi!';
          break;
        case 500:
          errMessage = '(500) Kesalahan internal server. Untuk informasi lebih lanjut, mohon hubungi pihak administrasi!';
          break;
        case 599:
          errMessage = "(599) Status tak diketahui. Tidak dapat mengakses menu ini untuk sementara waktu karena sedang dilakukan perawatan. Untuk informasi lebih lanjut, mohon hubungi pihak administrasi!";
          break;
        default:
          errMessage = '${dioErr.response!.statusCode != null ? "(${dioErr.response!.statusCode!}) " : ""}Kesalahan tak diketahui. Untuk informasi lebih lanjut, mohon hubungi pihak administrasi!';
          break;
      }

      OkDialog(
          context: context,
          message: errMessage,
          showIcon: false,
          okFunction: () async {
            if(errCode == 401) {
              await LocalAuthorization.delete().then((result) {
                if(result == true) {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext target) => const SplashScreen()), (route) => false);
                }
              });
            }
          }
      ).show();
    }
  }
}