import 'package:flutter/material.dart';
import 'package:mvp_architecture/view/internet_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internet Check (MVP)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InternetScreen(),
    );
  }
}
