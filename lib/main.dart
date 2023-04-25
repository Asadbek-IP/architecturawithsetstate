import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/pages/home_page.dart';
import 'package:lesson2/viewmodel/home_view_model.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: HomePage(),
    );
  }
}
