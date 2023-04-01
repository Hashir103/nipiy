// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nipiy/widgets/animate_water.dart';
import 'package:nipiy/widgets/navbar.dart';

import '../widgets/animated_water.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  @override
  Widget build(BuildContext context) {
    var value;
    return GestureDetector(
      onTap: () =>  FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 237, 248, 249),
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
          body: Container(child: Text('Test Page')),
    ));
  }
}
