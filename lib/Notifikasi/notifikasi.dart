import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (fixed but smaller)
          Positioned(
            top: 680,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/mountain_background2.png',
              height: 250,
              fit: BoxFit.contain,
            ),
          ),

          // Foreground content
          SafeArea(
            child: Column(
              children: [
                // Header row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Row(
                    children: const [
                      BackButton(),
                      Spacer(),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),

                // Clear all button
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Clear all",
                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),

                // Notification list
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: List.generate(10, (index) {
                        final titles = [
                          "Pengembalian Hari Ini!",
                          "Segera Kembalikan Barang",
                          "Pengingat Pengembalian",
                          "Barang Belum Dikembalikan",
                          "Deadline Hari Ini!",
                          "Harap Barang Dikembalikan!",
                          "Waktu Pengembalian Tiba",
                          "Keterlambatan Pengembalian",
                          "Terima Kasih Telah Menyewa",
                          "Jangan Lupa Kembalikan"
                        ];

                        final descriptions = [
                          "Silakan kembalikan perlengkapan camping Anda ke toko sebelum jam 17.00 WIB.",
                          "Jangan lupa mengembalikan tenda dan perlengkapan lainnya hari ini.",
                          "Kami mengingatkan bahwa barang sewa Anda harus dikembalikan hari ini.",
                          "Tenda, kompor, dan sleeping bag belum dikembalikan. Harap segera dikembalikan.",
                          "Batas waktu pengembalian perlengkapan Anda adalah hari ini.",
                          "Mohon segera mengembalikan barang rental Anda untuk menghindari denda.",
                          "Pengembalian perlengkapan camping sudah jatuh tempo hari ini.",
                          "Anda terlambat mengembalikan barang. Mohon segera hubungi pihak toko.",
                          "Terima kasih telah menyewa perlengkapan camping dari kami. Sampai jumpa lagi!",
                          "Pengembalian perlengkapan diperlukan hari ini. Jangan sampai terlambat!"
                        ];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        titles[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        descriptions[index],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.close, size: 18),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
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
