import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:ysrct_political/my_task/my_task.dart';

import '../total_fsmily_screen/total_family_screen.dart';

class HomePage extends StatelessWidget {
  Widget _buildStatCard(
      String label, String count, IconData icon, Color color) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: Offset(0, 3))
                ],
              ),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(icon, color: color, size: 28)),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(count,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 4),
                      Text(label, style: TextStyle(fontSize: 10.sp)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: Offset(0, 3))
                ],
              ),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(icon, color: color, size: 28)),
                  SizedBox(width: 6),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(count,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text(label, style: TextStyle(fontSize: 10.sp)),
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCardmain(
      String label, String count, IconData icon, Color color) {
    return SizedBox(
      width: double.infinity, // Set a fixed width for each card
      child: Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 6,
                offset: Offset(0, 3))
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: color, size: 28)),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(count,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Total Families",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add_circle_outline_sharp,
                        size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text("Add Family",
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String deadline) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 4),
              Text("Deadline: $deadline", style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Accept Task",
                  style: TextStyle(color: tWhite),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(
      String title, String dateTime, String location, String attendees) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(children: [
            Icon(Icons.access_time, size: 16),
            SizedBox(width: 6),
            Text(dateTime)
          ]),
          SizedBox(height: 6),
          Row(children: [
            Icon(Icons.location_on, size: 16),
            SizedBox(width: 6),
            Text(location)
          ]),
          SizedBox(height: 6),
          Row(children: [
            Icon(Icons.people, size: 16),
            SizedBox(width: 6),
            Text(attendees)
          ]),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Join Event",
              style: TextStyle(color: tWhite),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                backgroundColor: Colors.indigo),
          )
        ],
      ),
    );
  }

  Widget _buildPollCard(
      String question, List<String> options, String deadline) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ...options.map((option) => RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(option),
                value: option,
                groupValue: null,
                onChanged: (_) {},
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 4),
              Text("Deadline: $deadline", style: TextStyle(fontSize: 12)),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Submit Vote",
                  style: TextStyle(color: tWhite),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: Colors.indigo),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,

        // ignore: prefer_const_constructors
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(width: 10),
              // ignore: prefer_const_constructors
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksR3Lt2Iy2rlmUKvJmc27GcXpe297gINhTA&s")),
                    // color: Colors.blue.withOpacity(0.), // Light pink background
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome Back!",
                      style: GoogleFonts.amaranth(fontSize: 14)),
                  Text("Sujith Reddy",
                      style: GoogleFonts.amaranth(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ],
              ),
              Spacer(),

              Stack(
                alignment: Alignment.topRight,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue
                            .withOpacity(0.2), // Light pink background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.blue,
                      )),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.orange,
                    child: Text("10",
                        style: TextStyle(fontSize: 10, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TotalFamiliesPage()
                            // BottomNavigation()

                            ),
                      );
                    },
                    child: _buildStatCardmain("Total Members", "300",
                        Icons.check_circle, Colors.green),
                  ),
                  _buildStatCard(
                      "Total Members", "50", Icons.check_circle, Colors.green),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyTasksScreen()
                            // BottomNavigation()

                            ),
                      );
                    },
                    child: _buildStatCard(
                        "Tasks", "300", Icons.groups, Colors.blue),
                  ),
                  _buildStatCard("Tasks", "300", Icons.groups, Colors.blue),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: tWhite.withOpacity(0.6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Tasks",
                          style: GoogleFonts.amaranth(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: tPrimaryColor),
                        ),
                        Text(
                          "View All",
                          style: GoogleFonts.mulish(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildTaskCard(
                        "Distribute Publicity Materials", "12 Mar 2025"),
                    _buildTaskCard(
                        "Organize Meeting for Farmers", "12 Mar 2025"),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: GoogleFonts.amaranth(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade800),
                        ),
                        Text(
                          "View All",
                          style: GoogleFonts.mulish(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    _buildEventCard(
                        "Farmers Protest for MSP Bill",
                        "20 Mar 2025, 10:00 AM",
                        "Jantar Mantar, Delhi",
                        "2000+ Confirmed"),
                    _buildEventCard(
                        "Women’s Safety Awareness Rally",
                        "18 Mar 2025, 10:00 AM",
                        "Lucknow, UP",
                        "1500+ Confirmed"),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Polls",
                          style: GoogleFonts.amaranth(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade800),
                        ),
                        Text(
                          "View All",
                          style: GoogleFonts.mulish(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    _buildPollCard(
                        "Who is the Best Leader for Youth Development?",
                        ["Narendra Modi", "Rahul Gandhi", "Arvind Kejriwal"],
                        "15th March 2025"),
                    _buildPollCard("Do you support Farmers Bill?",
                        ["Yes", "No", "Can’t Say"], "15th March 2025"),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
