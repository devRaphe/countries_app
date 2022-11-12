import 'package:flutter/material.dart';

void main() {
  runApp(const CountriesApp());
}

/// This is the main root or top most widget.
class CountriesApp extends StatelessWidget {
  ///
  const CountriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
