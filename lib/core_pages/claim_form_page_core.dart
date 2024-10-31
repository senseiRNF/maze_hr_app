import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/claim_form_display.dart';

class ClaimFormPage extends StatefulWidget {
  const ClaimFormPage({super.key});

  @override
  State createState() => ClaimFormCore();
}

class ClaimFormCore extends State<ClaimFormPage> {
  int requestType = 1;

  TextEditingController claimNominalTEC = TextEditingController();

  List<File> attachmentList = [];

  @override
  void initState() {
    super.initState();
  }

  onChangeRequestType({required int index}) => setState(() {
    requestType = index;
  });

  onSubmitRequest() => DialogFunctions(
    context: context,
  ).okDialog(
    message: "Sukses mengirim permintaan",
    onClose: () => RouteFunctions(
      context: context,
    ).closeBack(),
  );

  @override
  Widget build(BuildContext context) {
    return ClaimFormDisplay(core: this);
  }
}