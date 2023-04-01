// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nipiy/pages/faq_page.dart';
import 'package:nipiy/pages/twitter_page.dart';
import 'package:nipiy/widgets/navbar.dart';

import 'launchpad_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List images = [
    "landing_illustration_0.png",
    "landing_illustration_2.png",
    "landing_illustration_1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // itemBuilder for scroller, it takes two params: context and index
        // _ is default context
        backgroundColor: const Color.fromARGB(255, 237, 248, 249),
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, pageIndex) {
              return Container(
                width: double.maxFinite,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: AssetImage("assets/" + images[pageIndex]),
                      alignment: Alignment.bottomCenter,
                      ),
                ),
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 80, left: 30, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pageIndex == 0 ? const LaunchpadWidget()
                            : pageIndex == 1
                                ? const FAQWidget()
                                : const TwitterEmbed(),
                        Column(
                            children: List.generate(3, (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: pageIndex == indexDots ? 25 :  12,
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: pageIndex == indexDots
                                  ? const Color.fromARGB(255, 82, 107, 172)
                                  : const Color.fromARGB(100, 82, 107, 172),
                            ),
                          );
                        })),
                      ],
                    )),
                    
              );
            }));
  }
}
