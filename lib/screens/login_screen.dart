import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart'; // Import RegisterScreen
import 'home_screen.dart'; // Import HomeScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color forgotPasswordColor = Colors.black;
  Color registerColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang di bagian atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/bg3.jpg',
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          // Container abu-abu dengan tinggi yang dikurangi
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2F2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  // Teks "Halo, Selamat Datang!"
                  Text(
                    'Halo, Selamat Datang!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Teks "Silahkan masukkan data anda untuk dapat akses"
                  Text(
                    'Silahkan masukkan data anda untuk dapat akses',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Input Username
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: 'Masukkan Username Anda',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Input Password
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        hintText: 'Masukkan Password Anda',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          forgotPasswordColor = const Color(0xFF0546FF);
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          forgotPasswordColor = Colors.black;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            forgotPasswordColor = const Color(0xFF0546FF);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: forgotPasswordColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tombol Login
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0546FF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Tombol "Sign in with Google"
                  GestureDetector(
                    onTap: () {
                      // Tambahkan logika sign in dengan Google di sini
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/google.png', // Ganti dengan path ikon Google
                              height: 20.0,
                              width: 20.0,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Teks Register
                  Center(
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          registerColor = const Color(0xFF0546FF);
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          registerColor = Colors.black;
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: registerColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    registerColor = const Color(0xFF0546FF);
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
