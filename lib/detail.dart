import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoe_app/paymentoption.dart';

class DetailPage extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String imagePath;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.imagePath,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  int selectedSize = 8;
  Color selectedColor = Colors.black;

  List<int> shoeSizes = [36, 38, 40, 42, 44];
  List<Color> colors = [Colors.black, Colors.brown];

  double get totalPrice {
    final price = double.tryParse(
          widget.productPrice.replaceAll(RegExp(r'[^\d.]'), ''),
        ) ??
        0;
    return price * quantity;
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: 'Rs. ',
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.blueAccent.shade400,
            Colors.lightBlue.shade800,
            Colors.lightBlueAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, 
        appBar: AppBar(
          title: Text(widget.productName),
          backgroundColor: Colors.white, // AppBar
          foregroundColor: Colors.black, // color for title and icons
          elevation: 0,
        ),
        body: Column(
          children: [
            const Divider(height: 2, color: Colors.white70),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Hero(
                          tag: widget.imagePath,
                          child: Image.asset(widget.imagePath, height: 200),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.productName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.productPrice,
                        style: const TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      Divider(color: Colors.white70),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Select Size",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: shoeSizes.length,
                                itemBuilder: (context, index) {
                                  final size = shoeSizes[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: ChoiceChip(
                                      label: Text(size.toString()),
                                      selected: selectedSize == size,
                                      onSelected: (_) {
                                        setState(() {
                                          selectedSize = size;
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Select Color",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: colors.map((color) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 6),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedColor == color
                                            ? Colors.black
                                            : Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: color,
                                      radius: 12,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: decrementQuantity,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.remove, size: 20),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: incrementQuantity,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.add, size: 20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Total: ${currencyFormatter.format(totalPrice)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'This shoe offers premium comfort and style, making it perfect for every step of your day.',
                              style: TextStyle(fontSize: 16, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Divider(color: Colors.white70),
                      const Text(
                        "Customer Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ListTile(
                        leading: const Icon(Icons.account_circle, size: 40, color: Colors.white),
                        title: const Text(
                          "Ramesh",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: const Text(
                          "Comfortable and stylish! Worth the price.",
                          style: TextStyle(color: Colors.white70),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Colors.white70),
                      ListTile(
                        leading: const Icon(Icons.account_circle, size: 40, color: Colors.white),
                        title: const Text(
                          "Yam",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: const Text(
                          "I love the quality within that price., but it was oversized",
                          style: TextStyle(color: Colors.white70),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            4,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added $quantity x ${widget.productName} (Size $selectedSize) to cart',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentOptionsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
