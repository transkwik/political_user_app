import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/constants/constants.dart';

class MyTasksScreen extends StatelessWidget {
  final List<Map<String, String>> newTasks = [
    {'title': 'Distribute Publicity Materials', 'deadline': '12 Mar 2025'},
    {'title': 'Organize Meeting for Farmers', 'deadline': '12 Mar 2025'},
    {'title': 'Organize Meeting for Farmers', 'deadline': '12 Mar 2025'},
  ];

  final List<Map<String, String>> acceptedTasks = [
    {'title': 'Collect Voter Data', 'deadline': '20 Mar 2025'},
  ];

  final List<Map<String, String>> completedTasks = [
    {
      'title': 'Collect Voter Data',
      'deadline': '20th March 2025',
      'submitted': '20 Mar 2025, 02:20 PM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFEAF2FB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEAF2FB),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:   EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:   Color(0xFFDCE5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:   Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
              ),
            ),
          ),
          title:   Text(
            'My Tasks',
            style:  GoogleFonts.amaranth( 
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: tPrimaryColor
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
                Text(
                'Your Contribution Matters!',
              style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300),

              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 39,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Background for all tabs (grey rounded)

                    // The actual TabBar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: tPrimaryColor, // Blue for selected
                          borderRadius: BorderRadius.circular(10),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.white,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.black87,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w600),
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.w500),
                        tabs: [
                          Container(
                            alignment: Alignment.center,
                            child: const Tab(text: 'New'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Tab(text: 'Accepted'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Tab(text: 'Completed'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // New Tasks Tab
                    ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: newTasks.length,
                      itemBuilder: (context, index) {
                        final task = newTasks[index];
                        return _buildTaskCard(
                            "Distribute Publicity Materials", "12 Mar 2025");
                      },
                    ),

                    // Accepted Tasks Tab
                    ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: acceptedTasks.length,
                      itemBuilder: (context, index) {
                        final task = acceptedTasks[index];
                        return AcceptedTaskCard(
                          title: task['title']!,
                          deadline: task['deadline']!,
                        );
                      },
                    ),

                    // Completed Tasks Tab
                    ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        final task = completedTasks[index];
                        return CompletedTaskCard(
                          title: task['title']!,
                          deadline: task['deadline']!,
                          submittedOn: task['submitted']!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New Task Card
class TaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String buttonLabel;
  final Color buttonColor;

  const TaskCard({
    required this.title,
    required this.deadline,
    required this.buttonLabel,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text("Deadline: $deadline",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: Text(buttonLabel),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Accepted Task Card
class AcceptedTaskCard extends StatelessWidget {
  final String title;
  final String deadline;

  const AcceptedTaskCard({required this.title, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Row(
                  children: [
                    Icon(Icons.check_circle, color: tPrimaryColor, size: 16),
                    SizedBox(width: 4),
                    Text('Accepted', style: TextStyle(color: tPrimaryColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text("Deadline: $deadline",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cloud_upload_outlined),
                    label: const Text("Upload Proof"),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Colors.white, // 👈 this sets the text color
                    backgroundColor: tPrimaryColor,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Submit Task"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Completed Task Card
class CompletedTaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String submittedOn;

  const CompletedTaskCard({
    required this.title,
    required this.deadline,
    required this.submittedOn,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Row(
                  children: [
                    Icon(Icons.check_circle, color: tSecondaryGreen, size: 22),
                    SizedBox(width: 4),
                    Text('Completed', style: TextStyle(color: tSecondaryGreen)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Deadline: $deadline",
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text("Submitted On: $submittedOn",
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
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
        SizedBox(height: 2.h),
          Center(
          child: SizedBox(
            width: 200,
            height:4.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Accept Task",
            style: GoogleFonts.manrope(
                            color: tWhite,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: tSecondaryGreen),
            ),
          ),
        ),
      ],
    ),
  );
}
