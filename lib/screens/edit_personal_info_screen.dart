import 'package:flutter/material.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  final String phoneNumber;
  final String email;
  final String dob;
  final String gender;
  final String address;
  final String emergencyPhone;

  EditPersonalInfoScreen({
  
    required this.phoneNumber,
    required this.email,
    required this.dob,
    required this.gender,
    required this.address,
    required this.emergencyPhone,
  });

  @override
  _EditPersonalInfoScreenState createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _genderController;
  late TextEditingController _addressController;
  late TextEditingController _emergencyPhoneController;

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _emailController = TextEditingController(text: widget.email);
    _dobController = TextEditingController(text: widget.dob);
    _genderController = TextEditingController(text: widget.gender);
    _addressController = TextEditingController(text: widget.address);
    _emergencyPhoneController = TextEditingController(text: widget.emergencyPhone);
  }

  @override
  void dispose() {
    
    _phoneNumberController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _emergencyPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Personal Information'),
        backgroundColor: Color(0xFF00CEE8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            buildTextField('Phone Number', _phoneNumberController),
            buildTextField('Email', _emailController),
            buildTextField('Date of Birth', _dobController),
            buildTextField('Gender', _genderController),
            buildTextField('Address', _addressController),
            buildTextField('Emergency Phone', _emergencyPhoneController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  
                  'phoneNumber': _phoneNumberController.text,
                  'email': _emailController.text,
                  'dob': _dobController.text,
                  'gender': _genderController.text,
                  'address': _addressController.text,
                  'emergencyPhone': _emergencyPhoneController.text,
                });
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                iconColor: Color(0xFF00CEE8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
