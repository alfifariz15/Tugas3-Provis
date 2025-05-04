import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          GestureDetector(
                            onTap: () {
                              print("Button In tapped");
                              // Navigator.push(...) untuk pindah halaman
                            },
                            child: Image.asset(
                              'assets/tombol_main/Sign in.png',
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
                              'assets/tombol_main/Home.png',
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
                              'assets/tombol_main/History.png',
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
                              'assets/tombol_main/Chat.png',
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
                              'assets/tombol_main/Cart.png',
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
                              'assets/tombol_main/Notification.png',
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
                              'assets/tombol_main/Review.png',
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
                              'assets/tombol_main/Profile.png',
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
                              'assets/tombol_main/Category.png',
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
                              'assets/tombol_main/Items.png',
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
                              'assets/tombol_main/Package.png',
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
                              'assets/tombol_main/Checkout.png',
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
                              'assets/tombol_main/Payment.png',
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
                              'assets/tombol_main/Payment_ops.png',
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
                              'assets/tombol_main/Waiting.png',
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
                              'assets/tombol_main/Success.png',
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
                              'assets/tombol_main/Detail_Trans.png',
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
                              print("Button In tapped");
                              // Navigator.push(...) untuk pindah halaman
                            },
                            child: Image.asset(
                              'assets/tombol_main/Help.png',
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
                              'assets/tombol_main/About.png',
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
                              'assets/tombol_main/TC.png',
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
