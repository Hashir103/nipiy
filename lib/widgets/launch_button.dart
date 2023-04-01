// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class LaunchButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  LaunchButton({super.key, this.isResponsive = false, this.width = 70});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 51, 60, 122)),
            child: Row(
              mainAxisAlignment: isResponsive==true ?  MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                Container( margin: const EdgeInsets.only(left: 10), child: Image.asset("assets/button_1.png",
                    width: 35, height: 35, ),),

                isResponsive == true ? Container(margin: const EdgeInsets.only(right: 10), child: AppText(textValue: 'Start using Nipiy now ', textColor: Color.fromARGB(225, 255, 255, 255), textSize: 18)) : Container()
              ]
            ));
  }
}
