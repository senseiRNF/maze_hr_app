import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/absence_page_core.dart';

class AbsenceDisplay extends StatelessWidget {
  final AbsenceCore core;

  const AbsenceDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kehadiran',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Rekap Kehadiran Bulanan',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Hadir',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- hari',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Sakit',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- hari',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Izin',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- hari',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Cuti',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- hari',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Sisa Cuti Tahunan',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Sisa',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- hari',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => core.onRequestAbsencePressed(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Text(
                  'Ajukan Permohonan Absen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => core.onAbsenceRequestReportPressed(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Text(
                  'Lihat Daftar Pengajuan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => core.onAbsenceReportPressed(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0,),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Text(
                  'Lihat Laporan Kehadiran',
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