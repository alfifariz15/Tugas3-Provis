import 'package:flutter/material.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [
    CartItem(name: 'Tent 4P', price: 50000, image: 'assets/tent.png', checked: true),
    CartItem(name: 'Camping Bag', price: 50000, image: 'assets/campingbag.png', checked: true),
    CartItem(name: 'Sleeping Bag', price: 50000, image: 'assets/sleepingbag.png', checked: true),
    CartItem(name: 'Jacket', price: 50000, image: 'assets/jacket.png'),
    CartItem(name: 'Umbrella', price: 50000, image: 'assets/umbrella.png'),
  ];

  // Format price with thousand separator
  String _formatPrice(int price) {
    // Convert price to string with thousand separator
    String priceStr = price.toString();
    String result = '';
    int count = 0;

    // Add dots for thousand separators
    for (int i = priceStr.length - 1; i >= 0; i--) {
      count++;
      result = priceStr[i] + result;
      if (count % 3 == 0 && i > 0) {
        result = '.' + result;
      }
    }

    return result + ',00';
  }

  bool allItemsChecked = false;

  int get totalCost =>
      items.where((item) => item.checked).fold(0, (sum, item) => sum + item.price * item.quantity);

  void toggleAllItems(bool? value) {
    setState(() {
      allItemsChecked = value ?? false;
      for (var item in items) {
        item.checked = allItemsChecked;
      }
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    final item = items[index];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter modalSetState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    'Remove from Cart',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // KIRI: Nama & Harga
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Rp.${_formatPrice(item.price)}/day',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                // KANAN: Quantity
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${item.quantity} items',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5A4032),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Remove',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
            'My Cart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Added spacing between AppBar and Column content
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      // Added top border for the first item
                      top: index == 0
                          ? BorderSide(color: Colors.grey.shade300, width: 1)
                          : BorderSide.none,
                      bottom: index < items.length - 1
                          ? BorderSide(color: Colors.grey.shade300, width: 1)
                          : BorderSide.none,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF5A4032),
                              value: item.checked,
                              onChanged: (value) {
                                setState(() => item.checked = value ?? false);
                              },
                            ),
                            SizedBox(width: 5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    'Rp.${_formatPrice(item.price)}/day',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(5, -19),
                                        child: Row(
                                          children: [
                                            // Tombol minus
                                            Container(
                                              width: 25, // Sedikit diperbesar agar lebih mudah disentuh
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius: BorderRadius.circular(4),
                                                  onTap: () {
                                                    setState(() {
                                                      if (item.quantity > 1) item.quantity--;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Icon(Icons.remove, size: 14, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              '${item.quantity}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            // Tombol plus
                                            Container(
                                              width: 25, // Sedikit diperbesar agar lebih mudah disentuh
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF5A4032),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius: BorderRadius.circular(4),
                                                  onTap: () {
                                                    setState(() {
                                                      item.quantity++;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Icon(Icons.add, size: 14, color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Modified delete button to show confirmation dialog
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => _showDeleteConfirmationDialog(context, index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.delete, color: Colors.white, size: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: allItemsChecked,
                      activeColor: Color(0xFF5A4032),
                      onChanged: toggleAllItems,
                    ),
                    Text(
                      'All Items',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Total Cost : ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Rp.${_formatPrice(totalCost)}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5A4032),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckoutPage()),
                    );
                  },
                  child: Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  final String image;
  bool checked;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.checked = false,
    this.quantity = 1,
  });
}