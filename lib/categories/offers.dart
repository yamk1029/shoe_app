import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoe_app/home_card.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final List<Map<String, String>> offersItems = [
    {'title': "Party", 'image': 'assets/items/offer1.png'},
    {'title': "Sports", 'image': 'assets/items/offer2.png'},
    {'title': "Formal", 'image': 'assets/items/offer3.png'},
    {'title': "Casual", 'image': 'assets/items/offer4.png'},
  ];

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Offers's Shoes",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  duration: const Duration(milliseconds: 1200),
                  child: const Text(
                    "Offers's Collection",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: offersItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                    itemBuilder: (context, index) {
                      final item = offersItems[index];
                      return FadeInUp(
                        duration: Duration(milliseconds: 1300 + (index * 100)),
                        child: HomeCard(
                          title: item['title']!,
                          image: item['image']!,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
