import 'package:flutter/material.dart';

class ClaimRequestListScreen extends StatefulWidget {
  const ClaimRequestListScreen({super.key});

  @override
  State<ClaimRequestListScreen> createState() => _ClaimRequestListScreenState();
}

class _ClaimRequestListScreenState extends State<ClaimRequestListScreen> {
  List claimRequestList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Pengajuan Klaim',
        ),
      ),
      body: claimRequestList.isNotEmpty ?
      ListView() :
      Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Icon(
                Icons.search_off,
                size: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Data Tak Ditemukan',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Usap kebawah untuk memperbaharui data',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          RefreshIndicator(
            onRefresh: () async {},
            child: ListView(),
          ),
        ],
      ),
    );
  }
}