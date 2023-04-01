// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nipiy/widgets/widget_info.dart';

import '../widgets/navbar.dart';

void main() => runApp(const InfoPage());

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 28, 89, 255),
          useMaterial3: true),
      home: const FabExample(),
    );
  }
}

class FabExample extends StatelessWidget {
  const FabExample({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(color: Color.fromARGB(125, 51, 60, 122))),
          ),
          shadowColor: Color.fromARGB(255, 26, 61, 95),
          backgroundColor: Color.fromARGB(200, 51, 60, 122),
          foregroundColor: Color.fromARGB(225, 255, 255, 255),
          title: Text(
            'N I P I Y',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              info_cards(),
            ],
          ),
        ),
      ),
    );
  }
}