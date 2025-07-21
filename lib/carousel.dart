import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoe_app/detail.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Crocodile Shoe',
        'price': '2500',
        'image': 'assets/slider/slider1.png',
        'text': 'Unbeatable Comfort,\n  Unstoppable You !',
        'color': Colors.pink[50],
      },
      {
        'name': 'Running Boot',
        'price': '3200',
        'image': 'assets/slider/slider2.png',
        'text': '  Upto 35% off',
        'color': Colors.blue[100],
      },
      {
        'name': 'Classic Sneaker',
        'price': '1800',
        'image': 'assets/slider/slider3.png',
        'text': 'Wear Smart \nWalk Smart.',
        'color': Colors.orange[100],
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: products.map((product) {
          return buildBanner(
            context: context,
            color: product['color']!,
            text: product['text']!,
            imagePath: product['image']!,
            productName: product['name']!,
            productPrice: product['price']!,
          );
        }).toList(),
      ),
    );
  }

  Widget buildBanner({
    required BuildContext context,
    required Color color,
    required String text,
    required String imagePath,
    required String productName,
    required String productPrice,
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 4, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          productName: productName,
                          productPrice: productPrice,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
