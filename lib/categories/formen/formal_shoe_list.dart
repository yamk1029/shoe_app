import 'package:flutter/material.dart';

class FormalShoeList extends StatefulWidget {
  const FormalShoeList({super.key});

  @override
  State<FormalShoeList> createState() => _FormalShoeListState();
}

class _FormalShoeListState extends State<FormalShoeList> {
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
      title: const Text('Formal Shoes',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
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
          child: const Center(child: Text('List of Formal Shoes')))),
      )
    );
  }
}
