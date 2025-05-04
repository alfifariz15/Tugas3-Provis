import 'package:flutter/material.dart';
import 'help.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: const ProfilePage(),
      theme: ThemeData(
        fontFamily: 'Poppins', // semua teks jadi Poppins
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget untuk item navigasi custom
class _NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.iconPath,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 24,
          height: 24,
          color: isActive ? Colors.blue : Colors.black,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}

// Widget untuk bottom navigation bar transparan
class TransparentBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TransparentBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white, // Transparansi disesuaikan
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => onTap(0),
              child: _NavItem(
                iconPath: 'assets/icons/home.png',
                label: 'Home',
                isActive: currentIndex == 0,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(1),
              child: _NavItem(
                iconPath: 'assets/icons/history.png',
                label: 'History',
                isActive: currentIndex == 1,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(2),
              child: _NavItem(
                iconPath: 'assets/icons/chat.png',
                label: 'Chat',
                isActive: currentIndex == 2,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: _NavItem(
                iconPath: 'assets/icons/cart.png',
                label: 'Cart',
                isActive: currentIndex == 3,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(4),
              child: _NavItem(
                iconPath: 'assets/icons/notification.png',
                label: 'Notification',
                isActive: currentIndex == 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Tambahan: Latar belakang putih transparan di seluruh halaman
        Positioned.fill(
          child: Container(
            color: Colors.white, // Ubah sesuai kebutuhan
          ),
        ),

        // Background gunung
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),


        // Layer utama aplikasi
        Scaffold(
          backgroundColor: Colors.transparent,
          // biar background gambar terlihat
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text(
              'Profile Page',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.png'),
                    // ganti dengan path gambar kamu
                    backgroundColor: Colors.transparent, // opsional
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'agus123',
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text("Email",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'agus123@gmail.com',
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text("Password",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const TextField(
                          enabled: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '***************',
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HelpPage()),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.help_outline, color: Colors.black),
                              SizedBox(width: 8),
                              Text('Help',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Logout logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5B4033),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Logout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
