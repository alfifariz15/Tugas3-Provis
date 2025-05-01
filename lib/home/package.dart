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

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tambahkan ini

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  List<Map<String, dynamic>> products = [
    {
      'price': 'Rp150,000 / Day',
      'suitableFor': 'Suitable for 5 people',
      'image': 'assets/tent_image.png',
      'name': 'Eiger Family Tent Package',
      'features': [
        'Eiger Family Tent (4-5 person)',
        '4 Sleeping Bags',
        'Portable Double-Burner Stove',
        'Camping Dining Set (for 5)',
        'Foldable Table & 6 Chairs',
      ],
      'quantity': 1,
    },
    // other products
  ];


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page!.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/back.png',
                        width: 28,
                        height: 28,
                        color: Colors.black, // Opsional: sesuaikan warna
                      ),
                      SizedBox(width: 8),
                      Text('Family Package', style: TextStyle(
                        fontFamily: 'Poppins SemiBold',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Centered Product Container
                  Expanded(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 16),

                            // Main Product Container
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE9831E),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        'Rp150,000 / Day',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Suitable for text
                                    Text(
                                      'Suitable for 5 people',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 12),

                                    // Features list - Simple version
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• Eiger Family Tent (4-5 person)',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• 4 Sleeping Bags',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• Portable Double-Burner Stove',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• Camping Dining Set (for 5)',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• Foldable Table & 6 Chairs',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Quantity controls
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove, size: 20),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add, size: 20),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 24),

                            // Action Buttons (below container)
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF3F5642),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    child: Text('Add to Cart', style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: BorderSide(color: Colors.black),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    child: Text('Rent Now',style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ),
                              ],
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
      bottomNavigationBar: TransparentBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Tambahkan navigasi jika diperlukan
        },
      ),
    );
  }
}