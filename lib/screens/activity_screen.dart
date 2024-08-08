import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'profile_screen.dart'; // Import ProfileScreen

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<Activity> allActivities = [

    Activity(date: DateTime(2024, 8, 6), day: 'Tues', clockIn: '09:00 WIB', clockOut: '17:00 WIB', isToday: true),
    Activity(date: DateTime(2024, 8, 5), day: 'Mon', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 8, 2), day: 'Fri', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 7, 31), day: 'Wed', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 7, 30), day: 'Tue', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 7, 29), day: 'Mon', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 6, 28), day: 'Fri', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 6, 27), day: 'Thurs', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
    Activity(date: DateTime(2024, 6, 26), day: 'Wed', clockIn: '09:00 WIB', clockOut: '17:00 WIB'),
  ];

  String selectedFilter = 'Bulanan';
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate;
  List<Activity> activities = [];
  int _selectedIndex = 1; // Set to 1 because Activity is at index 1

  @override
  void initState() {
    super.initState();
    _filterActivities();
  }

  void _filterActivities() {
    setState(() {
      if (selectedFilter == 'Harian') {
        activities = allActivities.where((activity) {
          return activity.date.year == DateTime.now().year &&
                 activity.date.month == DateTime.now().month &&
                 activity.date.day == DateTime.now().day;
        }).toList();
      } else if (selectedFilter == 'Mingguan') {
        DateTime startOfWeek = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
        activities = allActivities.where((activity) {
          return activity.date.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
                 activity.date.isBefore(endOfWeek.add(Duration(days: 1)));
        }).toList();
      } else if (selectedFilter == 'Bulanan') {
        activities = allActivities.where((activity) {
          return activity.date.month == currentMonth.month && activity.date.year == currentMonth.year;
        }).toList();
      } else if (selectedFilter == 'Pilih Tanggal' && selectedDate != null) {
        activities = allActivities.where((activity) {
          return activity.date.year == selectedDate!.year &&
                 activity.date.month == selectedDate!.month &&
                 activity.date.day == selectedDate!.day;
        }).toList();
      } else {
        activities = allActivities;
      }
    });
  }

  void _onFilterChanged(String filter) async {
    if (filter == 'Pilih Tanggal') {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedFilter = filter;
          currentMonth = DateTime(pickedDate.year, pickedDate.month); // Update the currentMonth
          _filterActivities();
        });
      }
    } else {
      setState(() {
        selectedFilter = filter;
        _filterActivities();
      });
    }
  }

  void _onMonthChanged(bool isNext) {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        isNext ? currentMonth.month + 1 : currentMonth.month - 1,
      );
      _filterActivities();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterButton(label: 'Hari Ini', isSelected: selectedFilter == 'Harian', onTap: () => _onFilterChanged('Harian')),
                FilterButton(label: 'Bulanan', isSelected: selectedFilter == 'Bulanan', onTap: () => _onFilterChanged('Bulanan')),
                FilterButton(label: 'Pilih Tanggal', isSelected: selectedFilter == 'Pilih Tanggal', onTap: () => _onFilterChanged('Pilih Tanggal')),
              ],
            ),
          ),
          if (selectedFilter != 'Harian')
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => _onMonthChanged(false),
                  ),
                  Text(
                    DateFormat('MMMM yyyy').format(currentMonth),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () => _onMonthChanged(true),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return ActivityCard(activity: activities[index]);
              },
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

class Activity {
  final DateTime date;
  final String day;
  final String clockIn;
  final String clockOut;
  final bool isToday;

  Activity({
    required this.date,
    required this.day,
    required this.clockIn,
    required this.clockOut,
    this.isToday = false,
  });
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        side: BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: activity.isToday ? Colors.blue : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd').format(activity.date),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  activity.day,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clock-in',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  activity.clockIn,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clock-out',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  activity.clockOut,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: activity.isToday ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
