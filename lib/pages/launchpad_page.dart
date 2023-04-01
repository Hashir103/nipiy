import 'package:flutter/material.dart';
import 'package:nipiy/pages/inventory_page.dart';

import '../widgets/app_header.dart';
import '../widgets/app_text.dart';
import '../widgets/launch_button.dart';
import 'main_page.dart';

class LaunchpadWidget extends StatelessWidget {
  const LaunchpadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(textValue: "Welcome to"),
          const AppHeaderText(
            textValue: "Nipiy",
            textColor: Color.fromARGB(255, 82, 107, 172),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 250,
              child: AppText(
                  textValue:
                      "An all-in-one water information service designed to educate and improve the water crisis for Indigenous people within Canada.",
                  textSize: 15,
                  textColor: const Color(0xFF878593))),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: LaunchButton(
              width: 250,
              isResponsive: true,
            ),
          ),
        ],
    );
  }
}
