import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoe_app/carousel.dart';
import 'package:shoe_app/categories/kidshoe.dart';
import 'package:shoe_app/categories/newarrival.dart';
import 'package:shoe_app/categories/offers.dart';
import 'package:shoe_app/categories/unisexualshoe.dart';
import 'package:shoe_app/categories/womenshoe.dart';
import 'package:shoe_app/home_card.dart';
import 'package:shoe_app/categories/menshoe.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        drawer: Drawer(
         backgroundColor: Colors.white,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue.shade800),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
                accountName: const Text("Shikhar User"),
                accountEmail: const Text("user@shikharshoe.com"),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(height: 1),
              ExpansionTile(
                leading: const Icon(Icons.category),
                title: const Text("Categories"),
                children: [
                  ListTile(
                    title: Center(child: const Text("Men's                   ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Menshoe(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Center(child: const Text("Women's               ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Womenshoe(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Center(child: const Text("Kids                     ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Kidshoe(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Center(child: const Text("Unisexuals          ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Unisexualshoe(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Center(child: const Text("Offers                  ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Offers(),
                        ),
                      );
                    },
                  ),                  
                  const Divider(height: 1),
                  ListTile(
                    title: Center(child: const Text("New Arrivals        ")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Newarrival(),
                        ),
                      );
                    },
                  ),                  
                ],
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("Cart"),
                onTap: () {},
              ),
              const Divider(height: 1),
              const Spacer(),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Exit"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Welcome',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Carousel(),
              // Welcome Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: FadeInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: Row(children: const [
                    ],
                  ),
                ),
              ),
              // Subtitle
              FadeInDown(
                duration: const Duration(milliseconds: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Explore Our New Arrivals',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
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
                        duration: const Duration(milliseconds: 1400),
                        child: const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            HomeCard(
                              title: 'Men\'s Shoes',
                              image: 'assets/items/mens1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Menshoe(),
                                  ),
                                );
                              },
                            ),
                            HomeCard(
                              title: 'Women\'s Shoes',
                              image: 'assets/items/womens1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Womenshoe(),
                                  ),
                                );
                              },
                            ),
                            HomeCard(
                              title: 'Kid\'s Shoes',
                              image: 'assets/items/kids1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Kidshoe(),
                                  ),
                                );
                              },
                            ),
                            HomeCard(
                              title: 'Unisexual\'s Shoes',
                              image: 'assets/items/unisexual1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Unisexualshoe(),
                                  ),
                                );
                              },
                            ),                                                        
                            HomeCard(
                              title: 'Offers',
                              image: 'assets/items/offer1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Offers(),
                                  ),
                                );
                              },
                            ),
                            HomeCard(
                              title: 'New Arrivals',
                              image: 'assets/items/new1.png',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Newarrival(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
