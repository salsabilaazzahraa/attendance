
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'profile_screen.dart'; 
import 'activity_screen.dart'; 
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime now;
  late Timer _timer;
  int _selectedIndex = 0;
  String? _selectedLocation; // Variable to store selected location

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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

  Future<void> _showLocationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Lokasi', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Radio(
                      value: 'IDS Indonesia Cilandak',
                      groupValue: _selectedLocation,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLocation = value;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 8),
                    Text('IDS Indonesia Cilandak'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                child: Row(
                  children: [
                    Radio(
                      value: 'IDS Indonesia Cibubur',
                      groupValue: _selectedLocation,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLocation = value;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 8),
                    Text('IDS Indonesia Cibubur'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('hh:mm a').format(now);
    String currentDate = DateFormat('EEEE, dd MMMM yyyy').format(now);
    bool isLate = now.isAfter(DateTime(now.year, now.month, now.day, 8, 5)) && now.isBefore(DateTime(now.year, now.month, now.day, 17, 0));
    bool isMorning = now.hour < 15;
    bool isAfternoon = now.hour >= 15;
    bool isWithinGracePeriod = now.isAfter(DateTime(now.year, now.month, now.day, 8, 0)) && now.isBefore(DateTime(now.year, now.month, now.day, 8, 5));

    return Scaffold(
      appBar: PreferredSize(
  preferredSize: Size.fromHeight(100.0),
  child: AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: const Color.fromARGB(0, 221, 217, 217), // Set to transparent
    flexibleSpace: Container(
      decoration: BoxDecoration(
        // Hapus DecorationImage
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/profil.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Indah Simurat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        'images/kantor1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'images/kantor2.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            'images/kantor3.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: _showLocationDialog,
                  ),
                  title: Text(
                    _selectedLocation ?? 'Pilih Lokasi Kantor Kamu Hari ini', // Show selected location or prompt to choose
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 37, 235, 40).withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                isMorning ? '08.00' : '17.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                currentTime,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      if (isMorning && isWithinGracePeriod)
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Toleransi keterlambatan 5 menit',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (isMorning && isLate)
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Anda sudah terlambat!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (!isMorning)
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Hati-hati di jalan!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      SizedBox(height: 5),
                      Text(
                        currentDate,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  trailing: _selectedLocation != null
                      ? ElevatedButton(
                          onPressed: () {
                            // Clock In functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isMorning
                                ? const Color.fromARGB(255, 112, 210, 255)
                                : !isMorning
                                    ? Colors.blue[900]
                                    : const Color.fromARGB(255, 112, 210, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          ),
                          child: Text(
                            isMorning
                                ? 'Clock In'
                                : !isMorning
                                    ? 'Clock Out'
                                    : 'Clock In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                children: [
                  _buildGridItem('images/butjadwal.png'),
                  _buildGridItem('images/butslipgaji.png'),
                  _buildGridItem('images/butkusioner.png'),
                  _buildGridItem('images/butkegiatan.png'),
                  _buildGridItem('images/butpengajuan.png'),
                  _buildGridItem('images/butinformasi.png'),
                ],
              ),
            ],
          ),
        ),
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

  Widget _buildGridItem(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 150, height: 150),
        SizedBox(height: 7),
        Text('', style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
