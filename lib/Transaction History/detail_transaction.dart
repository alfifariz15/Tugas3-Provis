import 'package:flutter/material.dart';

class DetailTransactionPage extends StatelessWidget {
  final String status;
  final bool showButton;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const DetailTransactionPage({
    super.key,
    required this.status,
    this.showButton = false,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background gambar bawah
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
                        'Detail Transaction',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Card detail
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Customer Information',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow("Name", "Fahmawati"),
                              _buildInfoRow("Phone Number", "08123123123"),
                              _buildInfoRow("Address", "Jl. Ciusuuk No.666"),

                              const Divider(height: 24),

                              const Text(
                                'Order Information',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow("No. Order", "CT-240425-001"),
                              _buildInfoRow("Retrieval Type", "Home Delivery"),
                              _buildInfoRow("Rental Date", "11-11-2042"),
                              _buildInfoRow("Rental Duration", "1 Days"),
                              _buildInfoRow("Payment Methods", "BCA Transfer"),
                              _buildInfoRow("Total Item", "6 Items"),

                              const Divider(height: 24),

                              const Text(
                                'Item List',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("1x Eiger backpack"),
                                  Text("200,000/Days", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("2x Eiger Tent Jumbo"),
                                  Text("200,000/Days", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("3x Lamp LED"),
                                  Text("200,000/Days", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),

                              const SizedBox(height: 12),
                              const Divider(),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Rp600,000",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              const Divider(height: 24),

                              Text(
                                "Status : $status",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  if (showButton && buttonText != null && onButtonPressed != null)
                    Center(
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7D5260),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                        ),
                        child: Text(
                          buttonText!,
                          style: const TextStyle(color: Colors.white),
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

  static Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(label),
          ),
          const Text(": "),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}