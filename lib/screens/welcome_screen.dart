import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0546FF), // Blue metallic
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'images/logo.png',
                  height: 100.0,
                  width: 100.0,
                ),
              ),
            ),
            const SizedBox(height: 5), // Mengurangi jarak antara gambar
            Image.asset(
              'images/des.png',
              height: 100.0, // Atur sesuai kebutuhan
              width: 100.0, // Atur sesuai kebutuhan
            ),
          ],
        ),
      ),
    );
  }
}
