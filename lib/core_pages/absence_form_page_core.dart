import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maze_hr_app/services/local/dialog_functions.dart';
import 'package:maze_hr_app/services/local/route_functions.dart';
import 'package:maze_hr_app/view_pages/absence_form_display.dart';

class AbsenceFormPage extends StatefulWidget {
  const AbsenceFormPage({super.key});

  @override
  State createState() => AbsenceFormCore();
}

class AbsenceFormCore extends State<AbsenceFormPage> {
  int requestType = 1;

  TextEditingController startDateTEC = TextEditingController();
  TextEditingController endDateTEC = TextEditingController();
  TextEditingController reasonTEC = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  List<File> attachmentList = [];

  @override
  void initState() {
    super.initState();
  }

  onChangeRequestType({required int index}) => setState(() {
    requestType = index;
  });

  onChangeDate({required bool isStartDate}) => showDatePicker(
    context: context,
    initialDate: isStartDate == true
        ? startDate ?? DateTime.now()
        : endDate ?? DateTime.now(),
    firstDate: DateTime(
      DateTime.now().year,
      DateTime.now().month,
    ),
    lastDate: DateTime(
      DateTime.now().year + 5,
    ),
  ).then((pickedDate) {
    if(pickedDate != null) {
      setState(() {
        if(isStartDate == true) {
          startDate = pickedDate;
          startDateTEC.text = DateFormat('dd/MM/yyyy').format(pickedDate);
        } else {
          endDate = pickedDate;
          endDateTEC.text = DateFormat('dd/MM/yyyy').format(pickedDate);
        }
      });
    }

    if(FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
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
    return AbsenceFormDisplay(core: this);
  }
}