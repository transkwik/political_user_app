import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/bottomnavigation.dart';
import 'package:ysrct_political/button.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:ysrct_political/responsive.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  String? selectedReportType;
  String? selectedConstituency;
  String? selectedLocation;
  int selectedPriority = -1;

  final incidentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final lightBlue = Color.fromARGB(255, 203, 223, 252);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 234, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(value),
                        decoration: BoxDecoration(
                          color: tGray.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Add Report",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      color: tWhite,
                      boxShadow: [tBoxShadow],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      _buildDropdown("Report Type", "Select report type",
                          selectedReportType, reportTypes, (val) {
                        setState(() => selectedReportType = val);
                      }),
                      const SizedBox(height: 16),
                      _buildDropdown("Constituency", "Select constituency",
                          selectedConstituency, constituencies, (val) {
                        setState(() => selectedConstituency = val);
                      }),
                      const SizedBox(height: 16),
                      _buildDropdown("Location", "Select location",
                          selectedLocation, locations, (val) {
                        setState(() => selectedLocation = val);
                      }),

                      const SizedBox(height: 16),

                      // Incident Description
                      Row(
                        children: [
                          const Text("Incident Description",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: incidentController,
                          maxLines: 6,
                          maxLength: 500,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                            border: InputBorder.none,
                            hintText: "Describe the incident in detail...",
                            counterText: "",
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Upload
                      Row(
                        children: [
                          const Text("Upload Evidence",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue.shade200,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue.shade50.withOpacity(0.3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.cloudArrowUp,
                                color: Colors.blue),
                            SizedBox(height: 8),
                            Text("Upload Proof",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 6),
                            Text("Supports: JPG, PNG, MP4 (max 10MB)",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Priority Level
                      Row(
                        children: [
                          const Text("Priority Level",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildPriorityButton("High", 0, Colors.red),
                          _buildPriorityButton("Medium", 1, Colors.orange),
                          _buildPriorityButton("Low", 2, Colors.green),
                        ],
                      ),
                        SizedBox(height:4.h),

                      // Submit Button
                      Button(
                          height: 5.4.h,
                          // height:  "20",
                          width: isTab(context) ? 100.w : 60.w,
                          textcolor: tWhite,
                          bottonText: 'Submit Report'.tr,
                          onTap: (startLoading, stopLoading, btnState) async {
                            startLoading();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigation()),
                            );
                            stopLoading();
                          }),
                      // Center(
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Color(0xFF005BEA),
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 50, vertical: 16),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20)),
                      //     ),
                      //     onPressed: () {
                      //       // Submit action
                      //     },
                      //     child: const Text("Submit Report",
                      //         style: TextStyle(fontSize: 16,color: tWhite)),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> reportTypes = [
    "Social Media Case",
    "Land Dispute",
    "Sand Mafia",
    "Ration Mafia",
    "Harassment",
    "Crime",
    "Rape",
    "Others"
  ];

  final List<String> constituencies = [
    "Constituency 1",
    "Constituency 2",
    "Constituency 3",
    "Constituency 4",
  ];

  final List<String> locations = [
    "Village A",
    "Village B",
    "Village C",
    "Town X",
  ];

  Widget _buildDropdown(
    String title,
    String hint,
    String? selectedValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            hint: Text(hint),
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: const InputDecoration(border: InputBorder.none),
            items: options
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildPriorityButton(String text, int index, Color color) {
    bool isSelected = selectedPriority == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPriority = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
