import 'package:flutter/material.dart';

import 'app/screens/library_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LibraryHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
