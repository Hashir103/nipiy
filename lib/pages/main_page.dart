import 'package:flutter/material.dart';
import 'package:nipiy/pages/info.dart';
import 'package:nipiy/pages/inventory_page.dart';
import 'package:nipiy/pages/map.dart';

import 'landing_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    InventoryPage(),
    MapPage(),
    InfoPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 51, 60, 122),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items:[
          BottomNavigationBarItem(label:"Inventory",icon: Icon(Icons.invert_colors)),
          BottomNavigationBarItem(label:"Map",icon: Icon(Icons.map)),
          BottomNavigationBarItem(label:"Info",icon: Icon(Icons.perm_device_info)),
        ]
      ),
    );
  }
}
