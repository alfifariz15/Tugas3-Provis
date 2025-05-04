import 'package:campteria/Notifikasi/notifikasi.dart';
import 'package:campteria/Our%20Reviews%20Page/our_reviews_page.dart';
import 'package:campteria/Payment/cart.dart';
import 'package:campteria/Payment/checkout.dart';
import 'package:campteria/Payment/payment.dart';
import 'package:campteria/Payment/paymentmethod.dart';
import 'package:campteria/Payment/pickup.dart';
import 'package:campteria/Payment/waiting.dart';
import 'package:campteria/Profile%20Page%20and%20Help/about_us.dart';
import 'package:campteria/Profile%20Page%20and%20Help/contact_us.dart';
import 'package:campteria/Profile%20Page%20and%20Help/help.dart';
import 'package:campteria/Profile%20Page%20and%20Help/profile_page.dart';
import 'package:campteria/Profile%20Page%20and%20Help/terms_and_conditions.dart';
import 'package:campteria/Transaction%20History/detail_transaction.dart';
import 'package:campteria/Transaction%20History/transaction_history.dart';
import 'package:campteria/home.dart';
import 'package:campteria/home/category.dart';
import 'package:campteria/home/detail_product.dart';
import 'package:campteria/home/package.dart';
import 'package:campteria/login.dart';
import 'package:flutter/material.dart';

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
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 20),
                          const Text(
                            'Kelompok 5',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: Color(0xFF4A3A2E),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Sign in.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Home.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TransactionHistoryPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/History.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WhatsAppLauncherPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Chat.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CartPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Cart.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NotificationsPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Notification.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OurReviewsPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Review.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Profile.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CategoryPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Category.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailProductPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Items.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PackagePage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Package.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CheckoutPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Checkout.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Payment()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Payment.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PaymentMethodPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Payment_ops.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ConfirmPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Waiting.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PickupPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Success.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailTransactionPage(status: "Done")), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Detail_trans.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Button In tapped");
                              // Navigator.push(...) untuk pindah halaman
                            },
                            child: Image.asset(
                              'assets/tombol_main/Return.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HelpPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Help.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AboutUsPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/About.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TermsAndConditionsPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/TC.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ContactUsPage()), // ← ini dari `package.dart`
                              );
                            },
                            child: Image.asset(
                              'assets/tombol_main/Contact.png',
                              width: 300,
                              height: 80,
                            ),
                          ),
                        ],
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
