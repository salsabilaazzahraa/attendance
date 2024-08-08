import 'package:aurora_presence_flutter/screens/activity_screen.dart';
import 'package:aurora_presence_flutter/screens/home_screen.dart';
import 'package:aurora_presence_flutter/screens/personal_screen.dart';
import 'package:aurora_presence_flutter/screens/work_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2; // Set to 2 because Profile is at index 2

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityScreen()), // Navigate to ActivityScreen
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to ProfileScreen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color(0xFF00CEE8),
            ),
          ),
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profil.png'),
            ),
          ),
          Positioned(
            top: 180,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: Column(
              children: [
                Text(
                  "Tya Malika",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "UI/UX Designer",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 235),
            decoration: BoxDecoration(
              color: Color(0xFFF5F2F2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text(
                      "Personal Information",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.work, color: Colors.black),
                    title: Text(
                      "Work Information",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorkScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.lightBlue,
        buttonBackgroundColor: Colors.lightBlue,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 200),
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
