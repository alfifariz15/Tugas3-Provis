import 'package:flutter/material.dart';
import 'main.dart'; // pastikan import

void main() {
  runApp(const CamptariaApp());
}

class CamptariaApp extends StatelessWidget {
  const CamptariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins', // semua teks jadi Poppins
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Langsung pindah ke Login setelah 2 detik tanpa animasi
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  'CAMPTERIA',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Color(0xFF4A3A2E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
