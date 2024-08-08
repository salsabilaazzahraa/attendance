import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_personal_info_screen.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  String phoneNumber = "1321589";
  String email = "tya@gmail.com";
  String dob = "01/05/1999";
  String gender = "Perempuan";
  String address = "Blok M";
  String emergencyPhone = "5642875";

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
                  "Personal Information",
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
                          builder: (context) => EditPersonalInfoScreen(
                            
                            phoneNumber: phoneNumber,
                            email: email,
                            dob: dob,
                            gender: gender,
                            address: address,
                            emergencyPhone: emergencyPhone,
                          ),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          
                          phoneNumber = result['phoneNumber'];
                          email = result['email'];
                          dob = result['dob'];
                          gender = result['gender'];
                          address = result['address'];
                          emergencyPhone = result['emergencyPhone'];
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
                      "General Info",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                  
                    buildInfoRow("Phone Number", phoneNumber),
                    buildInfoRow("Email", email),
                    buildInfoRow("Date of Birth", dob),
                    buildInfoRow("Gender", gender),
                    buildInfoRow("Address", address),
                    buildInfoRow("Emergency Phone", emergencyPhone),
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
