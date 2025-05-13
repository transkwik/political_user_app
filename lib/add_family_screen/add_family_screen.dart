import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_family_member_details/add_family_member_details.dart';

class AddFamilyScreen extends StatefulWidget {
  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {
  final TextEditingController _familyNameController = TextEditingController();

  String? selectedReligion;
  String? selectedCasteCategory;
  String? selectedCaste;

  final List<String> religions = ['Hindu', 'Muslim', 'Christian'];
  final List<String> casteCategories = ['OC', 'BC', 'OBC', 'SC', 'ST'];
  final List<String> castes = ['Reddy', 'Kapu', 'Yadav', 'Kamma'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF2F6FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Text(
          'Add Family',
           style: GoogleFonts.amaranth( 
            color: Color(0xFF1B4D9B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Expanded(
         child: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text('Add Family',
                    style: GoogleFonts.amaranth(    color: Color(0xFF1B4D9B),
                      
                      fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                _buildTextField(
                    "Name Of Family", "Enter family name", _familyNameController),
                SizedBox(height: 20),
                _buildDropdown("Religion", religions, selectedReligion, (val) {
                  setState(() => selectedReligion = val);
                }),
                SizedBox(height: 20),
                _buildDropdown(
                    "Caste Category", casteCategories, selectedCasteCategory,
                    (val) {
                  setState(() => selectedCasteCategory = val);
                }),
                SizedBox(height: 20),
                _buildDropdown("Caste", castes, selectedCaste, (val) {
                  setState(() => selectedCaste = val);
                }),
            ],
           ),
         ),
               ),
          Center(
          child: SizedBox(
            width: 240,
            height: 50,
            child: ElevatedButton(
              onPressed: () {

  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddFamilyMemberScreen()
                            // BottomNavigation()

                            ),
                      );

              },
              style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // Important to remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        backgroundColor: Colors.transparent, // Transparent to show gradient
        shadowColor: Colors.transparent, // Optional: no shadow
              ),
              child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B4D9B), Color(0xFF1472D4),Color(0xFF1B4D9B)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Next",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
              ),
            ),
          ),
        ),
        
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 196, 246),
                  width: 0.5), // Blue border on focus
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 196, 246),
                  width: 0.5), // Blue border on focus
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 196, 246),
                  width: 0.5), // Blue border on focus
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 196, 246),
                  width: 0.5), // Blue border on focus
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        )
      ],
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 196, 246),
                  width: 0.5), // Blue border on focus
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 153, 187, 242),
                  width: 0.5), // Blue border on focus
            ),
          ),
          hint: Text(
            'Select ${label.toLowerCase()}',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: onChanged,
        )
      ],
    );
  }
}
