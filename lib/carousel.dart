import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: [
          buildBanner(
            color: Colors.pink[50]!,
            text: 'Want to get \nbest Shoe',
            imagePath: 'assets/slider/slider1.png',
          ),
          buildBanner(
            color: Colors.blue[100]!,
            text: 'Upto 35% off',
            imagePath: 'assets/slider/slider2.png',
          ),
          buildBanner(
            color: Colors.orange[100]!,
            text: 'Buy now, \nPay after a week',
            imagePath: 'assets/slider/slider3.png',
          ),
        ],
      ),
    );
  }

  Widget buildBanner({
    required Color color,
    required String text,
    required String imagePath,
  }) {
    return Container(
      width: 300, // Adjusted width
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
                Text(
                  'Get Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(
              imagePath,
              width: 100, // Adjust image size
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
