import 'package:campteria/Payment/checkout.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String? selectedPayment;
  bool bankExpanded = true;
  bool eMoneyExpanded = false;

  Widget buildExpandableCategory({
    required String title,
    required List<Map<String, String>> options,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          ...options.map((option) {
            return Column(
              children: [
                ListTile(
                  leading: option['icon'] != ''
                      ? Image.asset(option['icon']!, width: 24)
                      : null,
                  title: Text(
                    option['label']!,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),
                  trailing: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: Color(0xFF5A4032),
                    value: selectedPayment == option['label'],
                    onChanged: (value) {
                      setState(() {
                        selectedPayment = option['label'];
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      selectedPayment = option['label'];
                    });
                  },
                ),
                Divider(height: 1),
              ],
            );
          }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bankTransferOptions = [
      {'icon': 'assets/bca.png', 'label': 'Bank BCA'},
      {'icon': 'assets/mandiri.png', 'label': 'Bank Mandiri'},
      {'icon': 'assets/bri.png', 'label': 'Bank BRI'},
    ];

    final eMoneyOptions = [
      {'icon': 'assets/gopay.png', 'label': 'Gopay'},
      {'icon': 'assets/dana.png', 'label': 'Dana'},
      {'icon': 'assets/shopeepay.png', 'label': 'ShopeePay'},
    ];

    final codOption = {'icon': '', 'label': 'Cash on Delivery (COD)'};

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Kembali ke CheckoutPage
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Payment Options',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildExpandableCategory(
                    title: 'Bank Transfer',
                    options: bankTransferOptions,
                    isExpanded: bankExpanded,
                    onTap: () => setState(() => bankExpanded = !bankExpanded),
                  ),
                  SizedBox(height: 5),
                  buildExpandableCategory(
                    title: 'E-Money',
                    options: eMoneyOptions,
                    isExpanded: eMoneyExpanded,
                    onTap: () => setState(() => eMoneyExpanded = !eMoneyExpanded),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cash on Delivery (COD)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          activeColor: Color(0xFF5A4032),
                          value: selectedPayment == 'Cash on Delivery (COD)',
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = 'Cash on Delivery (COD)';
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5A4032),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "Confirm Payment Method",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
