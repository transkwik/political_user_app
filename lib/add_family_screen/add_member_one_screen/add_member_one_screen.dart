import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMemberPageone extends StatefulWidget {
  @override
  _AddMemberPageoneState createState() => _AddMemberPageoneState();
}

class _AddMemberPageoneState extends State<AddMemberPageone> {
  final _formKey = GlobalKey<FormState>();
  String selectedGender = 'Male'; // default or empty string

  String? _name;
  DateTime? _dob;
  String? _gender;
  String? _qualification;
  String? _caste;
  String? _maritalStatus;
  String? _occupation = "Farmer";

  List<String> qualifications = ["High School", "Graduate", "Post Graduate"];
  List<String> castes = ["General", "OBC", "SC", "ST"];
  List<String> maritalStatuses = ["Married", "Unmarried"];

  List<String> ysrcpSchemes = ["Amma Vodi", "Fee Reimbursement"];
  List<String> kutamiSchemes = ["Mahasakthi", "Pension"];

  List<String> selectedYSRCPSchemes = [];
  List<String> selectedKutamiSchemes = [];

  String? ysrcpAmount;
  String? kutamiAmount;

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() => _dob = pickedDate);
    }
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue,
      Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
      value: selectedValue,
      hint: Text(label),
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
    );
  }

  Widget _buildCheckboxList(List<String> items, List<String> selectedItems) {
    return Column(
      children: items.map((item) {
        return CheckboxListTile(
          value: selectedItems.contains(item),
          title: Text(item),
          onChanged: (val) {
            setState(() {
              if (val == true) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add Member",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B4D9B))),
                      Icon(Icons.close, size: 28, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Enter name",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(15)),
                    onChanged: (val) => _name = val,
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: _selectDate,
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: _dob != null
                              ? DateFormat('dd MMM yyyy').format(_dob!)
                              : 'Select date',
                          suffixIcon: Icon(Icons.calendar_today),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GenderSelector(
                    selectedGender: selectedGender,
                    onSelect: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    initialValue: _occupation,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildDropdown(
                      "Select qualification",
                      qualifications,
                      _qualification,
                      (val) => setState(() => _qualification = val)),
                  SizedBox(height: 15),
                  _buildDropdown("Caste", castes, _caste,
                      (val) => setState(() => _caste = val)),
                  SizedBox(height: 15),
                  _buildDropdown(
                      "Marital Status",
                      maritalStatuses,
                      _maritalStatus,
                      (val) => setState(() => _maritalStatus = val)),
                  SizedBox(height: 25),
                SchemeSelector(),

                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter benefit amount",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(15)),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => ysrcpAmount = val,
                  ),
                  SizedBox(height: 15),
                  Text("Kutami Regime"),
                  _buildCheckboxList(kutamiSchemes, selectedKutamiSchemes),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter benefit amount",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(15)),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => kutamiAmount = val,
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [Color(0xFF1B4D9B), Color(0xFF397FE6)]),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Submit logic here
                          }
                        },
                        child: Text("Save", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenderSelector extends StatefulWidget {
  final String selectedGender;
  final Function(String) onSelect;

  GenderSelector({required this.selectedGender, required this.onSelect});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: genders.map((gender) {
        bool isSelected = widget.selectedGender == gender;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onSelect(gender);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Color(0xFF1B4D9B) : Colors.grey.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                color: isSelected ? Colors.blue.shade50 : Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                gender,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Color(0xFF1B4D9B) : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
class SchemeSelector extends StatefulWidget {
  @override
  _SchemeSelectorState createState() => _SchemeSelectorState();
}

class _SchemeSelectorState extends State<SchemeSelector> {
  final Map<String, List<String>> schemesMap = {
    'YSRCP Regime': ['Amma Vodi', 'Fee Reimbursement'],
    'Kutami Regime': ['Mahasakthi', 'Pension'],
  };

  String selectedRegime = 'YSRCP Regime';
  Map<String, bool> selectedSchemes = {};

  @override
  void initState() {
    super.initState();
    _initSelectedSchemes();
  }

  void _initSelectedSchemes() {
    selectedSchemes = {
      for (var scheme in schemesMap[selectedRegime]!) scheme: false,
    };
  }

  void _onRegimeChanged(String? value) {
    if (value != null && value != selectedRegime) {
      setState(() {
        selectedRegime = value;
        _initSelectedSchemes();
      });
    }
  }

  void _onSchemeToggled(String scheme) {
    setState(() {
      selectedSchemes[scheme] = !(selectedSchemes[scheme] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Schemes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),

        // Dropdown
        DropdownButtonFormField<String>(
          value: selectedRegime,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          ),
          items: schemesMap.keys.map((String regime) {
            return DropdownMenuItem<String>(
              value: regime,
              child: Text(regime),
            );
          }).toList(),
          onChanged: _onRegimeChanged,
        ),
        SizedBox(height: 12),

        // Checkboxes
        ...schemesMap[selectedRegime]!.map((scheme) {
          return CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: selectedSchemes[scheme] ?? false,
            title: Text(scheme),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Color(0xFF1B4D9B),
            onChanged: (_) => _onSchemeToggled(scheme),
          );
        }).toList(),
      ],
    );
  }
}
