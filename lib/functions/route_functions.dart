import 'package:flutter/material.dart';

class MoveTo {
  final BuildContext context;
  final Widget target;
  final Function? callback;

  const MoveTo({
    required this.context,
    required this.target,
    this.callback,
  });

  void go() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext targetContext) => target,
      ),
    ).then((result) {
      if(callback != null) {
        callback!(result);
      }
    });
  }
}

class ReplaceWith {
  final BuildContext context;
  final Widget target;

  const ReplaceWith({
    required this.context,
    required this.target,
  });

  void go() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext targetContext) => target,
      ),
    );
  }
}

class Back {
  final BuildContext context;
  final dynamic result;

  const Back({
    required this.context,
    required this.result,
  });

  void go() {
    Navigator.of(context).pop(result);
  }
}