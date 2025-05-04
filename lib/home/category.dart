import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
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

class _HomePageState extends State<CategoryPage> {
  int _currentIndex = 0; // Tambahkan ini

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Map<String, dynamic>> products = [
    {
      'name': 'EIGER EQUANTOR',
      'price': 'Rp120,000',
      'description': 'Tenda eiger kapasitas +2 orang',
      'image': 'assets/products/produk.png'
    },
    {
      'name': 'EIGER EQUANTOR',
      'price': 'Rp120,000',
      'description': 'Tenda eiger kapasitas +2 orang',
      'image': 'assets/products/produk.png'
    },
    {
      'name': 'EIGER EQUANTOR',
      'price': 'Rp120,000',
      'description': 'Tenda eiger kapasitas +2 orang',
      'image': 'assets/products/produk.png'
    },
    {
      'name': 'EIGER EQUANTOR',
      'price': 'Rp120,000',
      'description': 'Tenda eiger kapasitas +2 orang',
      'image': 'assets/products/produk.png'
    },
    // Tambahkan produk lainnya...
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
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search items',
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Tent', style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        ), // <-- This was missing
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                products[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    products[index]['name'],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: products[index]['color']?.withOpacity(0.2) ?? Color(0xFF624E47 ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      products[index]['price'],
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: products[index]['color'] ?? Colors.white
                                      ),
                                    ),
                                  ),
                                  Text(
                                    products[index]['description'],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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