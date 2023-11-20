import 'package:flutter/material.dart';
import 'package:library_app_test/app/screens/welcome_page.dart';

class LibraryHome extends StatelessWidget {
  const LibraryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Library App', 
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ), 
      body: const WelcomePage(),
    );
  }
}