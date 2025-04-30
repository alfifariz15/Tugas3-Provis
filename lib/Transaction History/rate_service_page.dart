import 'package:campteria/Transaction%20History/transaction_history.dart';
import 'package:flutter/material.dart';

class RateServicePage extends StatefulWidget {
  const RateServicePage({super.key});

  @override
  State<RateServicePage> createState() => _RateServicePageState();
}

class _RateServicePageState extends State<RateServicePage> {
  int selectedRating = 0;
  final TextEditingController feedbackController = TextEditingController();

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Rate Our Service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Star rating
                  Center(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                return IconButton(
                                  icon: Icon(
                                    index < selectedRating ? Icons.star : Icons.star_border,
                                    color: Colors.amber,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedRating = index + 1;
                                    });
                                  },
                                );
                              }),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "How Satisfied",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Textarea
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: feedbackController,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          hintText: "Describe your experience!",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Send button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransactionHistoryPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7D5260),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                      ),
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
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