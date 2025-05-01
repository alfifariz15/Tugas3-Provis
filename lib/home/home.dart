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
  final List<Map<String, dynamic>> packages = [
    {
      'title': 'Family Package',
      'description': 'Paket Liburan seru bareng keluarga makin mudah! Paket Keluarga siap menemani petualangan alammu dengan perlengkapan lengkap dan nyaman',
      'people': 5,
      'color': Colors.orange, // Gunakan Colors.orange langsung
    },
    {
      'title': 'Couple Package',
      'description': 'Nikmati liburan bersama pasangan tercinta dengan paket lengkap dan suasana yang nyaman.',
      'people': 2,
      'color': Colors.pink, // Gunakan Colors.pink langsung
    },
    {
      'title': 'Adventure Pack',
      'description': 'Paket terbaik untuk tim petualang! Cocok untuk grup sahabat yang ingin menjelajah alam bebas dengan perlengkapan lengkap.',
      'people': 8,
      'color': Colors.green, // Gunakan Colors.green langsung
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Map<String, String>> categories = [
    {'icon': 'assets/icons/tent.png', 'label': 'Tent'},
    {'icon': 'assets/icons/cook.png', 'label': 'Cooking'},
    {'icon': 'assets/icons/lighting.png', 'label': 'Lighting'},
    {'icon': 'assets/icons/table&chair.png', 'label': 'Tables & Chairs'},
    {'icon': 'assets/icons/bag.png', 'label': 'Bags'},
    {'icon': 'assets/icons/cloth.png', 'label': 'Clothing'},
    {'icon': 'assets/icons/compass.png', 'label': 'Survival Tools'},
    {'icon': 'assets/icons/firstaid.png', 'label': 'First Aid'},
  ];

  final List<Map<String, dynamic>> reviews = [
    {'user': 'Ujang251', 'review': 'Alats-alat camping terlengkap!', 'stars': 5},
    {'user': 'KomunitasA', 'review': 'Barang-barang lengkap sekali!', 'stars': 4},
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
                      SizedBox(width: 8),
                      Image.asset(
                        'assets/icons/profile.png',
                        width: 28,
                        height: 28,
                        color: Colors.black, // Opsional: sesuaikan warna
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Package', style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 160,
                    child: PageView.builder(
                      itemCount: packages.length,
                      controller: _pageController,
                      itemBuilder: (context, index) => SizedBox(
                        width: 550,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // Bagian atas oranye dengan judul
                              Container(
                                decoration: BoxDecoration(
                                  color: packages[index]['color'] as Color, // Cast eksplisit
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    packages[index]['title'] as String,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // Konten bawah
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Deskripsi (justify text)
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 24),
                                          child: Text(
                                            packages[index]['description'] as String,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: Colors.black,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Number and People (centered with 8 lines spacing)
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                                        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                                        children: [
                                          Text(
                                            packages[index]['people'].toString(),
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 10), // 8 lines spacing (assuming line height ≈14)
                                          Center( // Extra center widget for precise alignment
                                            child: Text(
                                              'People',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(packages.length, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
                          child: index == _currentPage
                              ? Image.asset( // Indikator aktif (persegi panjang besar)
                            'assets/icons/persegi_panjang.png',
                            width: 24,
                            height: 8,
                            color: Colors.grey,
                          )
                              : Container( // Indikator non-aktif (lingkaran kecil)
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Category', style: TextStyle(
                    fontFamily: 'Poppins ExtraBold',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: categories.map((cat) {
                      return SizedBox(
                        width: 72, // 4 item per baris
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                cat['icon']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              cat['label']!,
                              style: TextStyle(
                                fontFamily: 'Poppins SemiBold',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30),
                  Text('Our Review', style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviews.length,
                      itemBuilder: (context, index) => Card(
                        margin: EdgeInsets.only(right: 12),
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                reviews[index]['review']!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14, // atau ukuran lain sesuai kebutuhan
                                  color: Colors.black, // bisa disesuaikan
                                ),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: List.generate(reviews[index]['stars'], (i) => Icon(Icons.star, size: 30, color: Colors.orange)),
                              ),
                              SizedBox(height: 25),
                              Text(
                                reviews[index]['user']!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700, // Sesuai dengan SemiBold
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
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