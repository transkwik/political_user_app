import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/constants/constants.dart';

import 'addreport/addreport_gd.dart';

 
class ReportCrimeScreen extends StatelessWidget {
  const ReportCrimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(value),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDE6F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {  Navigator.pop(context);},
                    ),
                  ),
                  const SizedBox(width: 12),
                    Text(
                    "Report Crime or Extortion",
                    style: GoogleFonts.amaranth(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: tPrimaryColor),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Reports",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: tPrimaryColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddReportScreen()),
                              );
                    },
                    icon: const Icon(Icons.add_circle_outline_outlined,       color: Colors.white,),
                    label: const Text("Add Report",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:    tPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    ReportCard(
                      title: "Illegal Extortion",
                      date: "20 Mar 2025, 10:00 AM",
                      status: "Submitted",
                      statusColor: Colors.green,
                      statusIcon: Icons.check_circle,
                    ),
                    SizedBox(height: 12),
                    ReportCard(
                      title: "Land Mafia Report",
                      date: "20 Mar 2025, 10:00 AM",
                      status: "Pending",
                      statusColor: Colors.orange,
                      statusIcon: Icons.access_time,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final IconData statusIcon;

  const ReportCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1e000000),
            blurRadius: 6
          ),],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment. start,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
                Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(statusIcon, size: 18, color: statusColor),
              const SizedBox(width: 4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              )
            ],
          )
            ],
          ),
          const SizedBox(height: 6),
          Text(
            "Submitted on : $date",
            style: const TextStyle(
              fontSize: 14,
              color: tGray,
            ),
          ),
        
        
        ],
      ),
    );
  }
} 
