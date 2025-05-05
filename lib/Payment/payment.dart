import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'waiting.dart';
import 'checkout.dart';

TextStyle get _poppins => const TextStyle(fontFamily: 'Poppins');

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF2E7D32); // Hijau tua

    return Scaffold(
      backgroundColor: Colors.white,  // Set the background color of the Scaffold
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Container(
        color: Colors.white,  // Set the body background to white
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/bca.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Bank BCA',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Account Number :',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                SizedBox(width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '69857 67654',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: '69857 67654'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account number copied!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text(
                    'Salin',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xFF2E7D32), // dark green
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 5),
            const Divider(height: 30),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'How to Transfer via BCA Mobile:',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      '''1. Open BCA Mobile app
2. Tap m-BCA > Enter your PIN
3. Select m-Transfer
4. Choose Transfer to BCA Account
5. Enter the account number: 69857 67654
6. Enter the total amount
7. Confirm the recipient: Faiz Bayu
8. Tap Send and confirm''',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 30),
            const SizedBox(height: 7),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Upload Transfer Receipt',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5A4032),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Upload',
                    style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConfirmPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A4032),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Confirm Payment",
                  style: _poppins.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
