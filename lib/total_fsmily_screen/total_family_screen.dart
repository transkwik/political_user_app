import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_family_screen/add_family_screen.dart';

class TotalFamiliesPage extends StatelessWidget {
  final List<Map<String, dynamic>> families = [
    {
      "name": "Reddy Families",
      "members": 5,
      "religion": "🕉️",
      "caste": "OBC",
      "ysrcp": 100000,
      "kutami": 0,
    },
    {
      "name": "Reddy Families",
      "members": 5,
      "religion": "☪️",
      "caste": "OC",
      "ysrcp": 100000,
      "kutami": 0,
    },
    {
      "name": "Reddy Families",
      "members": 5,
      "religion": "✝️",
      "caste": "OC",
      "ysrcp": 100000,
      "kutami": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF4FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFF4FB),
        elevation: 0,
        toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004AAD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding:   EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onPressed: () {

                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddFamilyScreen()
                            // BottomNavigation()

                            ),
                      );
            },
            icon:   Icon(Icons.add_circle_outline_outlined, color: Colors.white, size: 18),
            label:   Text(
              "Add Family",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
        ],
        
        title: Text(
          "Total Families (50)",
          style: GoogleFonts.amaranth(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004AAD),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 0, right: 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            // Header

            // List of families
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: families.length,
                itemBuilder: (context, index) {
                  final family = families[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          family["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "${family["members"]} Members",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(width: 8),
                            Text(family["religion"],
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(width: 8),
                            Text(
                              "• ${family["caste"]}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "YSRCP : ₹ ${family["ysrcp"].toStringAsFixed(0)}",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Kutami : ₹ ${family["kutami"].toStringAsFixed(0)}",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
