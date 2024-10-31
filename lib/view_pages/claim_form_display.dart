import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_hr_app/core_pages/claim_form_page_core.dart';

class ClaimFormDisplay extends StatelessWidget {
  final ClaimFormCore core;

  const ClaimFormDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Pengajuan Klaim',
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
                    'Jenis Pengajuan Klaim',
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: core.requestType,
                        onChanged: (radioValue) => core.onChangeRequestType(
                          index: 1,
                        ),
                        title: const Text(
                          'Pengobatan',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        activeColor: Theme.of(context).colorScheme.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: core.requestType,
                        onChanged: (radioValue) => core.onChangeRequestType(
                          index: 2,
                        ),
                        title: const Text(
                          'Transportasi',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: core.requestType,
                        onChanged: (radioValue) => core.onChangeRequestType(
                          index: 3,
                        ),
                        title: const Text(
                          'Meeting / Visit',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                      RadioListTile(
                        value: 4,
                        groupValue: core.requestType,
                        onChanged: (radioValue) => core.onChangeRequestType(
                          index: 4,
                        ),
                        title: const Text(
                          'Lain-lain',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        dense: true,
                        activeColor: Theme.of(context).colorScheme.primary,
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
                    controller: core.claimNominalTEC,
                    decoration: InputDecoration(
                      label: Text(
                        'Jumlah yang diajukan (Rp)',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(5.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemCount: core.attachmentList.length + 1,
                        itemBuilder: (BuildContext attachmentContext, int index) {
                          return index == 0 ?
                          Card(
                            child: InkWell(
                              onTap: () => {},
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
                              onTap: () => {},
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => core.onSubmitRequest(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
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