import 'package:flutter/material.dart';

class OurReviewsPage extends StatelessWidget {
  const OurReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Amanda',
        'review': 'Pelayanan sangat baik, cepat dan ramah!',
        'rating': 5,
      },
      {
        'name': 'Budi',
        'review': 'Barang sesuai deskripsi, pengiriman aman.',
        'rating': 4,
      },
      {
        'name': 'Citra',
        'review': 'Sangat puas, pasti akan sewa lagi.',
        'rating': 5,
      },
      {
        'name': 'Dika',
        'review': 'Ada keterlambatan sedikit, tapi tetap responsif.',
        'rating': 4,
      },
      {
        'name': 'Eka',
        'review': 'Pengalaman yang menyenangkan, thanks!',
        'rating': 5,
      },
    ];

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Text(
                            'Our Reviews',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.person_outline),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Filter button
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt, size: 16, color: Colors.white),
                    label: const Text('Filter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7D5260),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // List of reviews
                  Expanded(
                    child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      review['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                            (i) => Icon(
                                          i < review['rating'] ? Icons.star : Icons.star_border,
                                          color: i < review['rating']
                                              ? Colors.amber
                                              : Colors.amber,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  review['review'],
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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