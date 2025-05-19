import 'package:flutter/material.dart';

class SportsShoeList extends StatefulWidget {
  const SportsShoeList({super.key});

  @override
  State<SportsShoeList> createState() => _SportsShoeListState();
}

class _SportsShoeListState extends State<SportsShoeList> {
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
      appBar: AppBar( backgroundColor: Colors.transparent,
      title: const Text('SPort Shoes',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
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
          child: const Center(child: Text('List of SPort Shoes')))),
      )
    );
  }
}
