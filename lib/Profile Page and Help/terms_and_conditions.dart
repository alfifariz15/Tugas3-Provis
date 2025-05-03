import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/mountain_background.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: "1. Renters must be at least ",
                              style: TextStyle(fontFamily: 'Poppins'),
                              children: [
                                TextSpan(
                                  text: "18 years old",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  " and present a valid ID (KTP/Driver’s License/Passport) during booking and pickup.",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text: "2. ",
                              style: TextStyle(fontFamily: 'Poppins'),
                              children: [
                                TextSpan(
                                  text:
                                  "Booking must be made at least 1 day in advance. ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  "Early reservation is recommended to ensure availability.",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text: "3. ",
                              style: TextStyle(fontFamily: 'Poppins'),
                              children: [
                                TextSpan(
                                  text: "Full payment (100%) ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  "is required upfront to confirm the rental. Payment can be made via Bank Transfer, E-Money or Cash on Delivery (COD).",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text: "4. Equipment can be picked up during ",
                              style: TextStyle(fontFamily: 'Poppins'),
                              children: [
                                TextSpan(
                                  text: "operational hours: 08.00 – 18.00 WIB.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  " Late pickup does not extend the rental period.",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text:
                              "5. Equipment must be returned on time. A late return fee of ",
                              style: TextStyle(fontFamily: 'Poppins'),
                              children: [
                                TextSpan(
                                  text: "Rp50,000/day ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                TextSpan(
                                  text: "will be charged.",
                                  style: TextStyle(fontFamily: 'Poppins'),
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
            ),
          ),
        ],
      ),
    );
  }
}
