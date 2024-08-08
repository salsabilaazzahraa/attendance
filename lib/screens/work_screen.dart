import 'package:aurora_presence_flutter/screens/edit_work_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkScreen extends StatefulWidget {
  @override
  _WorkScreenState createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  String employeeID = "4864";
  String department = "Some";
  String designation = "gjkghj";
  String workEmail = "TyaUI@gmail.com";
  String workLocation = "Jaksel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF00CEE8),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: Center(
                child: Text(
                  "Work Information",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.black),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditWorkInfoScreen(
                            employeeID: employeeID,
                            department: department,
                            designation: designation,
                            workEmail: workEmail,
                            workLocation: workLocation,
                            
                          ),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          employeeID = result['employeeID'];
                          department = result['department'];
                          designation = result['designation'];
                          workEmail = result['workEmail'];
                          workLocation = result['workLocation'];
                          
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 15,
            right: 15,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Work Detail",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    buildInfoRow("ID Karyawan", employeeID),
                    buildInfoRow("Departemen", department),
                    buildInfoRow("Penugasan", designation),
                    buildInfoRow("Email Kerja", workEmail),
                    buildInfoRow("Lokasi Kerja", workLocation),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Color(0xFFA6A6A6),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

