import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/button.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:ysrct_political/responsive.dart';

import '../bottomnavigation.dart';

class DetailsJoinTheRevolution extends StatefulWidget {
  @override
  _DetailsJoinTheRevolutionState createState() =>
      _DetailsJoinTheRevolutionState();
}

class _DetailsJoinTheRevolutionState extends State<DetailsJoinTheRevolution> {
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  String? selectedCaste;
  String? selectedConstituency;
  String? selectedMandalam;
  String? selectedAssembly;
  String? selectedDistrict;
  String? selectedTownVillage;

  bool isAgreed = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController OCCUPATIONController = TextEditingController();
  final TextEditingController cfmsIdController = TextEditingController();
  final TextEditingController clusterNoController = TextEditingController();
  final TextEditingController householdsController = TextEditingController();
  final TextEditingController mailIdController = TextEditingController();

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> ConstituencyOptions = [
    "Mylavaram",
    "Vijayawada",
    "Pulivendala",
    "Kadapa",
    "Tirupati"
  ];
  final List<String> casteOptions = ['OC', 'BC', 'SC', 'ST', 'Other'];
  final List<String> mandalamOptions = ['Mandal 1', 'Mandal 2'];
  final List<String> assemblyOptions = ['Assembly 1', 'Assembly 2'];
  final List<String> districtOptions = ['District 1', 'District 2'];
  final List<String> townVillageOptions = ['Town 1', 'Village 1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF2FC),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: tGray.withOpacity(0.2)),
              child:
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            ),
          )

          //  Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: Icon(Icons.arrow_back, color: Colors.black),
          //   ),
          // ),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: tWhite),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join the Revolution",
                    style: GoogleFonts.amaranth(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800),
                  ),
                  SizedBox(height: 40),
                     Text(
                    "District",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown("District", selectedDistrict, districtOptions,
                      (val) => setState(() => selectedDistrict = val)),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Town / Village",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildDropdown(
                  //     "Town / Village",
                  //     selectedTownVillage,
                  //     townVillageOptions,
                  //     (val) => setState(() => selectedTownVillage = val)),
                    SizedBox(height: 10),
              
                  Text(
                    "Constituency",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown(
                    
                      "Constituency",
                      selectedConstituency,
                      ConstituencyOptions,
                      (val) => setState(() => selectedConstituency = val)),
                  SizedBox(height: 10),
             Text(
                    "Town / Village",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown(
                      "Town / Village",
                      selectedTownVillage,
                      townVillageOptions,
                      (val) => setState(() => selectedTownVillage = val)),
                  SizedBox(height: 10),
                  // Text(
                  //   "Mandalam",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildDropdown("Mandalam", selectedMandalam, mandalamOptions,
                  //     (val) => setState(() => selectedMandalam = val)),
                  // SizedBox(height: 10),
                      Text(
                    "Full Name",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildTextField("Full Name", fullNameController),
                  SizedBox(height: 10),
           
               
                  
               
                  Text(
                    "Gender",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildGenderSelector(),
                  SizedBox(height: 10),
                  Text(
                    "Caste",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildDropdown("Caste", selectedCaste, casteOptions,
                      (val) => setState(() => selectedCaste = val)),
                  SizedBox(height: 10),
                  Text(
                    "Occupation",
                    style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildTextField("Enter occupation", OCCUPATIONController),
                  // SizedBox(height: 10),
                  // Text(
                  //   "CFMS ID",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildTextField("CFMS ID", cfmsIdController),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Cluster No.",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildTextField("Cluster No.", clusterNoController),
                  // SizedBox(height: 10),
                  // Text(
                  //   "No. of Households",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildTextField("No. of Households", householdsController),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Assembly",
                  //   style: GoogleFonts.manrope(
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  // SizedBox(height: 10),
                  // _buildDropdown("Assembly", selectedAssembly, assemblyOptions,
                  //     (val) => setState(() => selectedAssembly = val)),
               
                  SizedBox(height: 10),
                  Text(
                    "Mail ID",
                    style: GoogleFonts.amaranth(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  _buildTextField("Mail ID", mailIdController),
                  SizedBox(height: 60),
          
                  Button(
                      height: 5.4.h,
                      // height:  "20",
                      width: isTab(context) ? 100.w : 60.w,
                      textcolor: tWhite,
                      bottonText: 'Save'.tr,
                      onTap: (startLoading, stopLoading, btnState) async {
                        if (_formKey.currentState!.validate()) {
                          startLoading();
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigation()),
                            );
                            // Submit logic
                          }
                          //    Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           AppTypeScreen()
          
                          //       ),
                          // );
                          stopLoading();
                        }
                      }),
                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 50),
                  //     child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.blue.shade700,
                  //         minimumSize: Size(double.infinity, 50),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16),
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         if (_formKey.currentState!.validate()) {
                  //           // Submit logic
                  //         }
                  //       },
                  //       child: Text("Save",
                  //           style: TextStyle(fontSize: 18, color: tWhite)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        errorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)),
        ),
        focusedErrorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)),
        ),
        border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
       
               borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)),
        ),
      ),
      validator: (value) => value == null || value.isEmpty ? "Required" : null,
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return DropdownButtonFormField<String>(
//  style: ,
      decoration: InputDecoration(

        labelText: label,
       
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)), // White border when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)), // White border when not focused
        ),
        focusedErrorBorder:    OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)), // White border when not focused
        ),  
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)), // White border when not focused
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
              color: tGray.withOpacity(0.3)), // White border when not focused
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      value: value,
      items: items
       
          .map((item) => DropdownMenuItem<String>(
             
                child: Text(item),
                value: item,
              ))
          .toList(),
      onChanged: onChanged,
// padding: EdgeInsets.symmetric(horizontal: 20),
      dropdownColor: tWhite,
      validator: (val) => val == null ? "Required" : null,
    );
  }

  Widget _buildGenderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: genderOptions.map((gender) {
        final isSelected = selectedGender == gender;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => selectedGender = gender),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16.0),
                color: isSelected ? Colors.blue.shade50 : Colors.white,
              ),
              child: Column(
                children: [
                  Icon(
                    gender == "Male"
                        ? Icons.male
                        : gender == "Female"
                            ? Icons.female
                            : Icons.transgender,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  SizedBox(height: 4),
                  Text(gender,
                      style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.grey)),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
