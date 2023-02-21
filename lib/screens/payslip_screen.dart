import 'package:flutter/material.dart';

class PayslipScreen extends StatefulWidget {
  const PayslipScreen({super.key});

  @override
  State<PayslipScreen> createState() => _PayslipScreenState();
}

class _PayslipScreenState extends State<PayslipScreen> {
  List payslipList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Slip Gaji',
        ),
      ),
      body: payslipList.isNotEmpty ?
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
            onRefresh: () async {

            },
            child: ListView(),
          ),
        ],
      ),
    );
  }
}