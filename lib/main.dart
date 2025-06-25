import 'package:flutter/material.dart';

import 'package:campteria/login.dart';
import 'package:campteria/Payment/checkout.dart';
import 'package:campteria/home.dart';
import 'package:campteria/Payment/payment.dart';
import 'package:campteria/Transaction%20History/transaction_history.dart';
import 'package:campteria/Payment/paymentmethod.dart';
import 'package:campteria/Payment/waiting.dart';
import 'package:campteria/Payment/cart.dart';
import 'package:campteria/Payment/pickup.dart';
import 'package:campteria/Notifikasi/notifikasi.dart';
import 'package:campteria/Transaction%20History/detail_transaction.dart';
import 'package:campteria/Our%20Reviews%20Page/our_reviews_page.dart';
import 'package:campteria/Profile%20Page%20and%20Help/profile_page.dart';
import 'package:campteria/Profile%20Page%20and%20Help/help.dart';
import 'package:campteria/home/category.dart';
import 'package:campteria/Profile%20Page%20and%20Help/about_us.dart';
import 'package:campteria/home/detail_product.dart';
import 'package:campteria/Profile%20Page%20and%20Help/terms_and_conditions.dart';
import 'package:campteria/home/package.dart';
import 'package:campteria/Profile%20Page%20and%20Help/contact_us.dart';
import 'package:campteria/Transaction%20History/return_barang_fee.dart';


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
      home: const SplashScreen(), // Aplikasi dimulai dari SplashScreen
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
    // Pindah ke MainPage setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()), // Mengarah ke MainPage
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


// -- Kode dari main.dart original --

class MainPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'CAMPTERIA',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xFF4A3A2E),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Kelompok 5',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xFF4A3A2E),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            buildMenuButton('Sign in', 'assets/tombol_main/Sign in.png', LoginPage()),
                            buildMenuButton('Checkout', 'assets/tombol_main/Checkout.png', CheckoutPage()),
                            buildMenuButton('Home', 'assets/tombol_main/Home.png', HomePage()),
                            buildMenuButton('Payment', 'assets/tombol_main/Payment.png', Payment()),
                            buildMenuButton('History', 'assets/tombol_main/History.png', TransactionHistoryPage()),
                            buildMenuButton('Payment Ops', 'assets/tombol_main/Payment_ops.png', PaymentMethodPage()),
                            buildMenuButton('Chat', 'assets/tombol_main/Chat.png', WhatsAppLauncherPage()),
                            buildMenuButton('Waiting Confirm', 'assets/tombol_main/Waiting.png', ConfirmPage()),
                            buildMenuButton('Cart', 'assets/tombol_main/Cart.png', CartPage()),
                            buildMenuButton('Success Transact', 'assets/tombol_main/Success.png', PickupPage()),
                            buildMenuButton('Notification', 'assets/tombol_main/Notification.png', NotificationsPage()),
                            buildMenuButton('Detail Transact', 'assets/tombol_main/Detail_trans.png', DetailTransactionPage(status: "Done")),
                            buildMenuButton('Review', 'assets/tombol_main/Review.png', OurReviewsPage()),
                            buildMenuButton('Return Form', 'assets/tombol_main/Return.png', ReturnProductPage()),
                            buildMenuButton('Profile', 'assets/tombol_main/Profile.png', ProfilePage()),
                            buildMenuButton('Help', 'assets/tombol_main/Help.png', HelpPage()),
                            buildMenuButton('Category', 'assets/tombol_main/Category.png', CategoryPage()),
                            buildMenuButton('About Us', 'assets/tombol_main/About.png', AboutUsPage()),
                            buildMenuButton('Item details', 'assets/tombol_main/Items.png', DetailProductPage()),
                            buildMenuButton('Terms & Conditions', 'assets/tombol_main/TC.png', TermsAndConditionsPage()),
                            buildMenuButton('Package', 'assets/tombol_main/Package.png', PackagePage()),
                            buildMenuButton('Contact Us', 'assets/tombol_main/Contact.png', ContactUsPage()),
                          ],
                        ),
                      ],
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

  Widget buildMenuButton(String label, String assetPath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Image.asset(
        assetPath,
        width: 150,
        height: 60,
      ),
    );
  }
}