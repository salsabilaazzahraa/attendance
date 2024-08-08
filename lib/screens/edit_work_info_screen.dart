import 'package:flutter/material.dart';

class EditWorkInfoScreen extends StatefulWidget {
  final String employeeID;
  final String department;
  final String designation;
  final String workEmail;
  final String workLocation;
  

  EditWorkInfoScreen({
    required this.employeeID,
    required this.department,
    required this.designation,
    required this.workEmail,
    required this.workLocation,
    
  });

  @override
  _EditWorkInfoScreenState createState() => _EditWorkInfoScreenState();
}

class _EditWorkInfoScreenState extends State<EditWorkInfoScreen> {
  late TextEditingController _employeeIDController;
  late TextEditingController _departmentController;
  late TextEditingController _designationController;
  late TextEditingController _workEmailController;
  late TextEditingController _workLocationController;
 

  @override
  void initState() {
    super.initState();
    _employeeIDController = TextEditingController(text: widget.employeeID);
    _departmentController = TextEditingController(text: widget.department);
    _designationController = TextEditingController(text: widget.designation);
    _workEmailController = TextEditingController(text: widget.workEmail);
    _workLocationController = TextEditingController(text: widget.workLocation);
   
  }

  @override
  void dispose() {
    _employeeIDController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    _workEmailController.dispose();
    _workLocationController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Informasi Pekerjaan'),
        backgroundColor: Color(0xFF00CEE8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField('ID Karyawan', _employeeIDController),
            buildTextField('Departemen', _departmentController),
            buildTextField('Penugasan', _designationController),
            buildTextField('Email Kerja', _workEmailController),
            buildTextField('Lokasi Kerja', _workLocationController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'employeeID': _employeeIDController.text,
                  'department': _departmentController.text,
                  'designation': _designationController.text,
                  'workEmail': _workEmailController.text,
                  'workLocation': _workLocationController.text,
                  
                });
              },
              child: Text('Simpan'),
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
