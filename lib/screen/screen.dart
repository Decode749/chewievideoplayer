import 'package:flutter/material.dart';

import '../custom widget/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: const [
          CardWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
        ],
      )
    );
  }
}