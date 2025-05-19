import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoe_app/categories/formen/casual_shoe_list.dart';
import 'package:shoe_app/categories/formen/formal_shoe_list.dart';
import 'package:shoe_app/categories/formen/party_shoe_list.dart';
import 'package:shoe_app/categories/formen/sports_shoe_list.dart';
import 'package:shoe_app/home_card.dart';

class Menshoe extends StatefulWidget {
  const Menshoe({super.key});

  @override
  State<Menshoe> createState() => _MenshoeState();
}

class _MenshoeState extends State<Menshoe> {
  final List<Map<String, dynamic>> mensItems = [
    {
      'title': "Party",
      'image': 'assets/items/mens1.png',
      'widget': const PartyShoeList(),
    },
    {
      'title': "Sports",
      'image': 'assets/items/mens2.png',
      'widget': const SportsShoeList(),
    },
    {
      'title': "Formal",
      'image': 'assets/items/mens3.png',
      'widget': const FormalShoeList(),
    },
    {
      'title': "Casual",
      'image': 'assets/items/mens4.png',
      'widget': const CasualShoeList(),
    },
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
            "Men's Shoes",
            style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
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
                    "Men's Collection",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: mensItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                    itemBuilder: (context, index) {
                      final item = mensItems[index];
                      return FadeInUp(
                        duration: Duration(milliseconds: 1300 + (index * 100)),
                        child: HomeCard(
                          title: item['title']!,
                          image: item['image']!,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item['widget'],
                              ),
                            );
                          },
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
