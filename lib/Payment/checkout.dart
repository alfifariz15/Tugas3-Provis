import 'package:flutter/material.dart';
import 'paymentmethod.dart';
import 'payment.dart';
import 'cart.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class CartItem {
  final String name;
  final int price;
  final String image;
  final bool checked;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.checked = false,
  });
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  bool selfPickup = true;
  bool homeDelivery = false;

  final List<CartItem> items = [
    CartItem(name: 'Tent 4P', price: 50000, image: 'assets/tent.png', checked: true),
    CartItem(name: 'Camping Bag', price: 50000, image: 'assets/campingbag.png', checked: true),
    CartItem(name: 'Sleeping Bag', price: 50000, image: 'assets/sleepingbag.png', checked: true),
    CartItem(name: 'Jacket', price: 50000, image: 'assets/jacket.png'),
    CartItem(name: 'Umbrella', price: 50000, image: 'assets/umbrella.png'),
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 3, 9),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  TextStyle get _poppins => const TextStyle(fontFamily: 'Poppins');

  InputDecoration _customUnderlineDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: _poppins.copyWith(color: const Color(0xFF5A4032)),
      floatingLabelStyle: _poppins.copyWith(color: const Color(0xFF5A4032)),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF5A4032)),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Checkout', style: _poppins.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 10),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: _poppins.copyWith(color: Color(0xFF5A4032)),
                floatingLabelStyle: _poppins.copyWith(color: Color(0xFF5A4032)),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5A4032)),
                ),
              ),
              style: _poppins,
            ),

            const SizedBox(height: 10),

            // Phone TextField
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: _poppins.copyWith(color: Color(0xFF5A4032)),
                floatingLabelStyle: _poppins.copyWith(color: Color(0xFF5A4032)),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5A4032)),
                ),
              ),
              keyboardType: TextInputType.phone,
              style: _poppins,
            ),
            const SizedBox(height: 10),

            // Self Pickup and Home Delivery Checkboxes
            Row(
              children: [
                Checkbox(
                  value: selfPickup,
                  activeColor: const Color(0xFF5A4032),
                  checkColor: Colors.white,
                  onChanged: (val) {
                    setState(() {
                      selfPickup = val!;
                      if (val) homeDelivery = false;
                    });
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  "Self Pickup",
                  style: _poppins.copyWith(fontSize: 16),
                ),
                const SizedBox(width: 40),
                const SizedBox(width: 10),
                Checkbox(
                  value: homeDelivery,
                  activeColor: const Color(0xFF5A4032),
                  checkColor: Colors.white,
                  onChanged: (val) {
                    setState(() {
                      homeDelivery = val!;
                      if (val) selfPickup = false;
                    });
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  "Home Delivery",
                  style: _poppins.copyWith(fontSize: 16),
                ),
              ],
            ),

            // Conditional Fields for Home Delivery
            if (homeDelivery) ...[
              const SizedBox(height: 20),
              _buildAddressField("Address", addressController),
              const SizedBox(height: 10),
              _buildAddressField("City", cityController),
              const SizedBox(height: 10),
              _buildAddressField("State", stateController),
              const SizedBox(height: 10),
              _buildAddressField("Postal Code", postalCodeController),
              const SizedBox(height: 20),
            ],

            const SizedBox(height: 12),
            // Start Date TextField with rounded corners and slight border
            Text(
              "Start Date",
              style: _poppins.copyWith(fontSize: 16), // Ganti 18 dengan ukuran font yang diinginkan
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFF5A4032), width: 1), // Slight border
              ),
              child: TextField(
                controller: startDateController,
                readOnly: true,
                onTap: () => _selectDate(context, startDateController),
                decoration: const InputDecoration(
                  hintText: "09/03/2025",
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding
                ),
                style: _poppins,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              "End Date",
              style: _poppins.copyWith(fontSize: 16), // Ganti 18 dengan ukuran font yang diinginkan
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFF5A4032), width: 1), // Slight border
              ),
              child: TextField(
                controller: endDateController,
                readOnly: true,
                onTap: () => _selectDate(context, endDateController),
                decoration: const InputDecoration(
                  hintText: "11/03/2025",
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding
                ),
                style: _poppins,
              ),
            ),

            const SizedBox(height: 17),

            // Upload ID Photo Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upload ID Photo (KTP / SIM)",
                  style: _poppins.copyWith(fontSize: 16), // Ganti 18 dengan ukuran font yang diinginkan
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

            // Divider between sections
            const SizedBox(height: 10),
            Divider(color: Colors.grey, thickness: 1),

            // Order List Section
            Text(
              "Order List",
              style: _poppins.copyWith(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ...items.where((item) => item.checked).map((item) {
              return _buildItem(item.name, "1 x", "Rp.${item.price}", item.image);
            }).toList(),

            // Divider before Payment Details
            const Divider(),

            // Payment Option Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Choose Payment Option",
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethodPage()),
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5A4032),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),

            const SizedBox(height: 4),

            Text(
              "Payment Details :",
              style: _poppins.copyWith(
                fontSize: 16, // Ukuran font yang diinginkan
                fontWeight: FontWeight.w900, // Menentukan ketebalan font (bold)
              ),
            ),
            const SizedBox(height: 15),
            _paymentDetailRow("Total Price per Day", "Rp. 150.000"),
            _paymentDetailRow("Rental Durations", "3 Days"),
            const SizedBox(height: 5),
            _paymentDetailRow("Total", "Rp. 450.000", bold: true),
            const SizedBox(height: 20),

            // Continue To Payment Button
            // Di dalam widget build:
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A4032),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Continue To Payment",
                  style: _poppins.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String qty, String price, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 70, height: 70, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: _poppins),
                Text(qty, style: _poppins.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Text(price, style: _poppins),
        ],
      ),
    );
  }

  Widget _buildAddressField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: _poppins.copyWith(color: const Color(0xFF5A4032)), // Warna label
        floatingLabelStyle: _poppins.copyWith(color: const Color(0xFF5A4032)), // Warna label saat difokus
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF5A4032)), // Warna garis bawah saat fokus
        ),
      ),
      style: _poppins,
    );
  }

  Widget _paymentDetailRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: _poppins.copyWith(fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: _poppins.copyWith(fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}


