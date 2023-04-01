// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nipiy/pages/info.dart';
import 'package:nipiy/pages/landing_page.dart';
import 'package:nipiy/pages/inventory_page.dart';
import 'package:nipiy/pages/main_page.dart';
import 'package:nipiy/pages/map.dart';
import 'package:nipiy/widgets/animated_water.dart';
import 'package:nipiy/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nipiy',
      initialRoute: '/landing',
      routes: {
        '/': (context) => const MainPage(),
        '/inventory': (context) => InventoryPage(),
        '/map': (context) => const MapPage(),
        '/info': (context) => const InfoPage(),
        '/landing': (context) => const LandingPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       
    );
  }
}
