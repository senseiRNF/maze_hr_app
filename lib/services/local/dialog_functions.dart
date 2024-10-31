import 'package:flutter/material.dart';

/// Dialog Functions
///
/// This class serve as a provider whenever we need an easy alert dialog
class DialogFunctions {
  BuildContext context;

  DialogFunctions({required this.context});

  /// OK Dialog
  ///
  /// This function return an Alert dialog with content and "OK" button
  okDialog({
    String? title,
    Color? titleColor,
    required String message,
    Function? onClose,
    IconData? icon,
    Color? iconColor,
  }) => showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      icon: icon != null ?
      Icon(
        icon,
        color: iconColor,
      ) :
      null,
      title: Text(
        title ?? "Perhatian",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Oke",
          ),
        ),
      ],
    ),
  ).then((_) => onClose != null
      ? onClose()
      : {}
  );

  /// Yes Or No Dialog
  ///
  /// This function return an Alert dialog with content and "Yes" or "No" button
  yesOrNoDialog({
    String? title,
    required String message,
    Function? yesFunction,
    Function? noFunction,
  }) => showDialog(
    context: context,
    builder: (dialogResult) => AlertDialog(
      title: title != null ?
      Text(
        title,
      ) :
      null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "Tidak",
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "Ya",
          ),
        ),
      ],
    ),
  ).then((dialogResult) {
    if(dialogResult != null) {
      if(dialogResult == true && yesFunction != null) {
        yesFunction();
      } else if(dialogResult == false && noFunction != null) {
        noFunction();
      }
    }
  });

  /// Loading Dialog
  ///
  /// This function return an Alert dialog with a loading that can't be interupted
  loadingDialog() => showDialog(
    context: context,
    builder: (dialogContext) => PopScope(
      canPop: false,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sedang memuat, mohon tunggu...",
            ),
            const SizedBox(
              height: 15.0,
            ),
            LinearProgressIndicator(),
          ],
        ),
      ),
    ),
  );
}