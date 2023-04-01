// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nipiy/pages/info.dart';
import 'package:nipiy/pages/map.dart';

import '../pages/inventory_page.dart';
import '../pages/testpage2.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    InventoryPage(),
    MapPage(),
    InfoPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromARGB(255, 237, 248, 249),
          color: Color.fromARGB(255, 51, 60, 122),
          animationDuration: Duration(milliseconds: 350),
          onTap: (indexClicked) {
            if (indexClicked == 0) {
              Navigator.pushNamed(context, '/inventory');
            } else if (indexClicked == 1) {
              Navigator.pushNamed(context, '/map');
            } else if (indexClicked == 2) {
              Navigator.pushNamed(context, '/info');
            }
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            Icon(Icons.invert_colors_rounded,
                color: Color.fromARGB(255, 195, 202, 250)),
            Icon(Icons.map_outlined, color: Color.fromARGB(255, 195, 202, 250)),
            Icon(Icons.perm_device_information_rounded,
                color: Color.fromARGB(255, 195, 202, 250)),
          ]),
    );
  }
}
