import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maze_hr_app/functions/dialog_functions.dart';
import 'package:maze_hr_app/functions/route_functions.dart';

class AttendanceFormScreen extends StatefulWidget {
  const AttendanceFormScreen({super.key});

  @override
  State<AttendanceFormScreen> createState() => _AttendanceFormScreenState();
}

class _AttendanceFormScreenState extends State<AttendanceFormScreen> {
  int requestType = 1;

  TextEditingController startDateTEC = TextEditingController();
  TextEditingController endDateTEC = TextEditingController();
  TextEditingController reasonTEC = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  List<File> attachmentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Pengajuan Absen',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Jenis Pengajuan Absen',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: requestType,
                        onChanged: (radioValue) {
                          setState(() {
                            requestType = 1;
                          });
                        },
                        title: const Text(
                          'Sakit',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: requestType,
                        onChanged: (radioValue) {
                          setState(() {
                            requestType = 2;
                          });
                        },
                        title: const Text(
                          'Izin',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: requestType,
                        onChanged: (radioValue) {
                          setState(() {
                            requestType = 3;
                          });
                        },
                        title: const Text(
                          'Cuti',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: startDateTEC,
                    decoration: InputDecoration(
                      label: Text(
                        'Tanggal Mulai Pengajuan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: startDate != null ? startDate! : DateTime.now(),
                        firstDate: DateTime(DateTime.now().year, DateTime.now().month),
                        lastDate: DateTime(2027),
                      ).then((pickedDate) {
                        if(pickedDate != null) {
                          setState(() {
                            startDate = pickedDate;
                            startDateTEC.text = DateFormat('dd/MM/yyyy').format(startDate!);
                          });
                        }

                        if(FocusManager.instance.primaryFocus != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: endDateTEC,
                    decoration: InputDecoration(
                      label: Text(
                        'Tanggal Akhir Pengajuan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: endDate != null ? endDate! : DateTime.now(),
                        firstDate: DateTime(DateTime.now().year, DateTime.now().month),
                        lastDate: DateTime(2027),
                      ).then((pickedDate) {
                        if(pickedDate != null) {
                          setState(() {
                            endDate = pickedDate;
                            endDateTEC.text = DateFormat('dd/MM/yyyy').format(endDate!);
                          });
                        }

                        if(FocusManager.instance.primaryFocus != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: reasonTEC,
                    decoration: InputDecoration(
                      label: Text(
                        'Alasan Pengajuan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: endDate != null ? endDate! : DateTime.now(),
                        firstDate: DateTime(DateTime.now().year, DateTime.now().month),
                        lastDate: DateTime(2027),
                      ).then((pickedDate) {
                        if(pickedDate != null) {
                          setState(() {
                            endDate = pickedDate;
                            endDateTEC.text = DateFormat('dd/MM/yyyy').format(endDate!);
                          });
                        }

                        if(FocusManager.instance.primaryFocus != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                requestType == 1 ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Lampiran Surat Keterangan',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(5.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemCount: attachmentList.length + 1,
                        itemBuilder: (BuildContext attachmentContext, int index) {
                          return index == 0 ?
                          Card(
                            child: InkWell(
                              onTap: () {

                              },
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ) :
                          Card(
                            child: InkWell(
                              onTap: () {

                              },
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.attachment,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ) :
                const Material(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                OkDialog(
                  context: context,
                  message: 'Sukses mengirim permintaan',
                  showIcon: true,
                  okFunction: () {
                    Back(context: context, result: true).go();
                  },
                ).show();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Text(
                  'Kirim Permohonan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}