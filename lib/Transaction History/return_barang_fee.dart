import 'package:flutter/material.dart';

class ReturnProductPage extends StatefulWidget {
  const ReturnProductPage({super.key});

  @override
  State<ReturnProductPage> createState() => _ReturnProductPageState();
}

class _ReturnProductPageState extends State<ReturnProductPage> {
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Return Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Return Date',
                            style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            initialValue: '09/03/2025',
                            readOnly: true,
                            style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Today',
                            style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            initialValue: '10/03/2025',
                            readOnly: true,
                            style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Fee',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                  border: Border.all(color: Colors.black12),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Text(
                                        "⏱️  Late by: 1 day",
                                        style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "💵  Fee per day: \Rp. 30.000",
                                        style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                                      ),
                                      SizedBox(height: 8),
                                      Divider(thickness: 1),
                                      SizedBox(height: 6),
                                      Text(
                                        "Total Fee: \Rp 30.000",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "If you discover that any of your rented camping equipment is damaged or missing, please report it immediately to our team.",
                            style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "📞 Contact Us: +62 812-3456-7890\n✉️ Or email: support@campgear.id",
                            style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Reporting damages early helps us maintain the safety and quality of our gear for all campers.\n"
                                "Failure to report damages may result in additional fees upon return.",
                            style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                          ),
                          const SizedBox(height: 12),
                          const Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _fileName ?? "Upload Receipt Payment",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  minimumSize: const Size(100, 30),
                                ),
                                onPressed: () {  },
                                child: const Text(
                                  'UPLOAD',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Return",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}