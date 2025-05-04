import 'package:flutter/material.dart';
import 'detail_transaction.dart';
import 'rate_service_page.dart';
import 'return_barang_nonfee.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});
  void navigateToDetailByStatus(BuildContext context, String status) {
    if (status == 'Borrowed') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailTransactionPage(
            status: "Borrowed",
            showButton: true,
            buttonText: "Return",
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReturnNonFeePage(),
                ),
              );
            },
          ),
        ),
      );
    } else if (status == 'Waiting') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailTransactionPage(
            status: "Waiting",
            showButton: true,
            buttonText: "Waiting",
            onButtonPressed: () {
            },
          ),
        ),
      );
    } else if (status == 'On Delivery') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailTransactionPage(
            status: "On Delivery",
            showButton: true,
            buttonText: "On Delivery",
            onButtonPressed: () {
            },
          ),
        ),
      );
    } else if (status == 'Done') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailTransactionPage(
            status: "Done",
            showButton: true,
            buttonText: "Rate",
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RateServicePage(),
                ),
              );
            },
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'id': 'CT-241225-001', 'status': 'Done'},
      {'id': 'CT-241225-002', 'status': 'Done'},
      {'id': 'CT-241225-003', 'status': 'Waiting'},
      {'id': 'CT-241225-004', 'status': 'On Delivery'},
      {'id': 'CT-241225-005', 'status': 'Done'},
      {'id': 'CT-241225-006', 'status': 'Done'},
      {'id': 'CT-241225-007', 'status': 'Done'},
      {'id': 'CT-241225-008', 'status': 'Borrowed'},
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case 'Done':
          return const Color(0xFF44A650);
        case 'Waiting':
          return const Color(0xFF7D5260);
        case 'On Delivery':
          return const Color(0xFFC3CF30);
        case 'Borrowed':
          return const Color(0xFFAF8903);
        default:
          return Colors.grey;
      }
    }

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
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Transaction History',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                // Filter
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Aksi filter
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7D5260),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.filter_alt, size: 16, color: Colors.white),
                      label: const Text(
                        "Filter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                            onTap: () {
                              navigateToDetailByStatus(context, tx['status']!);
                            },
                              key: null,
                          title: Text(
                            tx['id']!,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Container(
                            constraints: BoxConstraints(minWidth: 80, maxWidth: 120),
                            height: 32,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: getStatusColor(tx['status']!),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tx['status']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
