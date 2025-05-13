import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_member_one_screen/add_member_one_screen.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  @override
  _AddFamilyMemberScreenState createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  List<Map<String, String>> familyMembers = [
    {"name": "Shravan Prajapati", "age": "40", "role": "Farmer"},
    {"name": "Heena Prajapati", "age": "38", "role": "Teacher"},
    {"name": "Riya Prajapati", "age": "12", "role": "Student"},
  ];

  void _addMember() {
    setState(() {
      familyMembers.add({
        "name": "New Member",
        "age": "0",
        "role": "Unknown",
      });

          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddMemberPageone()
                            // BottomNavigation()

                            ),
                      );
    });
  }

  void _removeMember(int index) {
    setState(() {
      familyMembers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6FAFF),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
       margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Add Family Member",
               style: GoogleFonts.amaranth(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B4D9B),
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F1FB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Prajapati Family",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text("5 Members",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        SizedBox(width: 10),
                        Icon(Icons.self_improvement, size: 18, color: Colors.purple),
                        SizedBox(width: 4),
                        Text("OBC",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
                Text("Family Member",
                  style: GoogleFonts.amaranth(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6B7A99),
                  )),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: familyMembers.length,
                  itemBuilder: (context, index) {
                    final member = familyMembers[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(member["name"]!,
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              Text("${member["age"]} • ${member["role"]}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => _removeMember(index),
                            child: const Icon(Icons.close,
                                size: 28, color: Color(0xFF1B4D9B)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _addMember,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD7E7FB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, color: Color(0xFF1B4D9B)),
                      SizedBox(width: 8),
                      Text("Add Member",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1B4D9B))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
