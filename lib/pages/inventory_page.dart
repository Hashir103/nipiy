// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nipiy/widgets/animate_water.dart';
import 'package:nipiy/widgets/navbar.dart';

import '../widgets/animated_water.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}


class _InventoryPageState extends State<InventoryPage> {
  final _waterAmountController = TextEditingController();
  final _householdNumberController = TextEditingController();
  final GlobalKey<WaterAnimationState> _childWidgetKey = GlobalKey();
  bool isChecked = false;

  void _updateChildValue(double newValue) {
    newValue > 60 ? newValue = 60 : newValue = newValue;
    _childWidgetKey.currentState?.updateValue(newValue);
  }

  double _result = 0.0;

  @override
  void dispose() {
    _waterAmountController.dispose();
    _householdNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          body: Container(
              color: Colors.transparent, 
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: Stack(children: <Widget>[
                  Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    width: 150,
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: WaterAnimation(key: _childWidgetKey),
                  )),
                          Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextField(
                        onChanged: (value) => {
                          _updateChildValue(
                            double.parse(value),
                          )
                        },
                        decoration: InputDecoration(
                          helperText: 'In Litres!',
                          labelText: 'Water Amount',
                          filled: true,
                          fillColor: Color.fromARGB(255, 230, 240, 240),
                          prefixIcon: Icon(Icons.water_drop_rounded,
                              color: Colors.blue.shade500),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: _waterAmountController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.house_rounded,
                              color: Colors.blue.shade500),
                          helperText: 'In people!',
                          labelText: 'Household',
                          filled: true,
                          fillColor: Color.fromARGB(255, 230, 240, 240),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: _householdNumberController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          double waterAmount =
                              double.parse(_waterAmountController.text);
                          double householdNumber =
                              double.parse(_householdNumberController.text);
                          _result = (waterAmount / (householdNumber * 2));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Color.fromARGB(255, 230, 240, 240),
                        padding: EdgeInsets.all(20),
                      ),
                      child:
                          Text(style: TextStyle(color: Colors.blue.shade500), '='),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _result == 0.0
                                ? 'Ensure to drink ~2L of water a day! 🌲'
                                : 'Result: $_result days left of water',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                                   Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Set a reminder'),
                              Checkbox(value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            });
                             }),
                        ])),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                          ),
                        ]),
              ))),
    );
  }
}
