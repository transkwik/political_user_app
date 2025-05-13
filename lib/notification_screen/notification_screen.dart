import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/constants/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF5F8FCFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFDCE5F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Notifications",
                    style: GoogleFonts.amaranth(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: tPrimaryColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    NotificationCard(
                      title:
                          'Scheme Approved: Ayushman Bharat Yojana for Rajesh Sharma',
                      date: '7 Mar 2025, 02:30 PM',
                      status: 'Accepted',
                      statusColor: tSecondaryGreen,
                    ),
                    NotificationCard(
                      title:
                          'You have accepted the task: Organize Meeting for Farmers',
                      date: '6 Mar 2025, 02:30 PM',
                      status: 'Voted',
                      statusColor: Color(0xFFB0A9F9),
                    ),
                    NotificationCard(
                      title:
                          'Scheme Approved: Ayushman Bharat Yojana for Rajesh Sharma',
                      date: '5 Mar 2025, 02:30 PM',
                      status: 'Approved',
                      statusColor: Color(0xFF7DA3D8),
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

class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;

  const NotificationCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.insert_drive_file_outlined,
                color: tPrimaryColor,
                size: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: tBlack),
                ),
              )
            ],
          ),
            SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: GoogleFonts.manrope(
                    fontSize: 9.sp, fontWeight: FontWeight.w500, color: tGray),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.manrope(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      color: tGray),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
