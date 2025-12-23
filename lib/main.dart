import 'package:flutter/material.dart';
import 'package:memes_app/screens/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Memes App",
      home: MemesHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
