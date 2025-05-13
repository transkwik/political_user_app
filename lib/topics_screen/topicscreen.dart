import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ysrct_political/bottomnavigation.dart';
import 'package:ysrct_political/constants/constants.dart';

class TopicsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> topics = [
    {"title": "Extortion", "count": 50},
    {"title": "Crimes on Women", "count": 10},
    {"title": "Sand Mafia", "count": 20},
    {"title": "Ration Mafia", "count": 5},
    {"title": "Corruption", "count": 9},
    {"title": "Sexual assaults", "count": 15},
    {"title": "Land Grabbing", "count": 12},
    {"title": "Protests", "count": 2},
    {"title": "Farmer Suicides", "count": 10},
    {"title": "Murders", "count": 3},
    {"title": "Social Media Cases", "count": 20},
    {"title": "Sanitation", "count": 1},
    {"title": "Medical Negligence", "count": 1},
    {"title": "Health care", "count": 15},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FB),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: const Color(0xFFEAF2FB),
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Topics',
            style: GoogleFonts.amaranth(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: tPrimaryColor,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEAF2FB).withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10), //
            )
          ],
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 00),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFEAF2FB).withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10), //
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: topics.length,
            separatorBuilder: (_, __) =>
                const Divider(color: Colors.transparent, height: 12),
            itemBuilder: (context, index) {
              final topic = topics[index];
              return ListTile(
                horizontalTitleGap: 10,
                minTileHeight: 48,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF2FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                title: Text(
                  '${topic["title"]} (${topic["count"]})',
                  style: GoogleFonts.wixMadeforDisplay(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigation()),
                            );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
