import 'package:flutter/material.dart';

/// Route Functions
///
/// This class serve as a provider whenever we need to navigate between each page
class RouteFunctions {
  BuildContext context;

  RouteFunctions({required this.context});

  /// Move To
  ///
  /// This function serve as a command to navigate to new page and the previous page still existed but not active
  moveTo({
    required StatefulWidget target,
    Function? callbackFunction,
  }) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (targetContext) => target,
    )
  ).then((callbackResult) => callbackFunction != null
      ? callbackFunction(callbackResult)
      : {});

  /// Replace With
  ///
  /// This function serve as a command to navigate to new page but the previous page are terminated
  replaceWith({
    required StatefulWidget target,
  }) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (targetContext) => target),
  );

  /// Redirect To
  ///
  /// This function serve as a command to navigate to new page but all of the previous page that stacked together are terminated
  redirectTo({
    required StatefulWidget target,
  }) => Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (targetContext) => target),
        (_) => false,
  );

  /// Close Back
  ///
  /// This function serve as a command to navigate to previous page and the current page are terminated
  closeBack({
    dynamic callbackResult,
  }) => Navigator.of(context).pop(callbackResult);
}