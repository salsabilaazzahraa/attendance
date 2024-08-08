import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/personal_screen.dart';
import 'screens/edit_personal_info_screen.dart';
import 'screens/work_screen.dart';
import 'screens/edit_work_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/personal': (context) => PersonalScreen(),
        '/editPersonalInfo': (context) => EditPersonalInfoScreen(

          phoneNumber: '',
          email: '',
          dob: '',
          gender: '',
          address: '',
          emergencyPhone: '',
        ),
        '/work': (context) => WorkScreen(),
        '/editWorkInfo': (context) => EditWorkInfoScreen(
          employeeID: '',
          department: '',
          designation: '',
          workEmail: '',
          workLocation: '',
  
        ),
      },
    );
  }
}
