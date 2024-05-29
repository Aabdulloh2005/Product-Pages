import 'package:flutter/material.dart';
import 'package:homework_46/views/screens/product_page.dart';

void main(List<String> args) {
  runApp(const MainRunner());
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
    );
  }
}
