import 'package:flutter/material.dart';

import '../view.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Form Validation'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
