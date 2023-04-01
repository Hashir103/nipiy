import 'package:flutter/material.dart';

import 'navbar.dart';

// info pill widget variable initializers
double showPill = -1000;
String waterSystem = '';
String firstNation = '';
String population = "";
String advisoryInfo = "";
String advisoryIcon = "assets/blueStatus.png";
String advisoryDate = "";

class infoPill extends StatelessWidget {
  const infoPill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(25),
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(
                0.8), // color: const Color.fromRGBO(40, 81, 131, 0.8),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      advisoryIcon,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Text(
                    advisoryInfo.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text('Since: $advisoryDate'),
                  const Text(''),
                  Text(
                    waterSystem,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'This notice targets the $firstNation group that lives near this water system.',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '\nPopulation Affected: $population'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class info_cards extends StatelessWidget {
  const info_cards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
            width: 400.0,
            height: 200.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('How to Boil Water'),
                      content: Wrap(
                        children: const [
                          Text(
                              'If you don’t have safe bottled water, you should boil your water to make it safe to drink. Boiling is the surest method to kill disease-causing germs, including viruses, bacteria, and parasites.\n'),
                          Text(
                            '1. Bring the clear water to a rolling boil for 1 minute (at elevations above 6,500 feet, boil for 3 minutes).\n2. Let the boiled water cool.\n3. Store the boiled water in clean sanitized containers with tight covers.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/boiling_water.jpeg'),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'How to Boil Water',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
            width: 400.0,
            height: 200.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Why is Drinking Water Important?'),
                      content: Wrap(
                        children: const [
                          Text(
                            'Water helps your body:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              '      - Keep a normal temperature.\n      - Lubricate and cushion joints.\n      - Protect your spinal cord and other sensitive tissues.\n      - Get rid of wastes through urination, perspiration, and bowel movements\n'),
                          Text(
                            'Your body needs MORE water when you are:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              '      - In hot climates.\n      - More physically active.\n      - Running a fever.\n      - Having diarrhea or vomiting.'),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/water_glass.jpeg'),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Why is Drinking Water Important?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
            width: 400.0,
            height: 200.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('How Water Can Get Contaminated'),
                      content: Wrap(
                        children: const [
                          Text(
                              'Germs and chemicals can get in drinking water at the water’s source or in the distribution system after the water has already been treated. Harmful germs and chemicals can get in the water from many sources, including:'),
                          Text(
                              '      - Fertilizers, pesticides, or other chemicals that have been applied to land near the water\n      - Concentrated feeding operations (large industrial animal farms)\n      - Manufacturing operations\n      - Sewer overflows\n      - Storm water\n      - Wildlife\n      - Rocks and soil that naturally have chemicals and minerals such as arsenic, radon, and uranium\n      - Cracks in water pipes or other problems in the distribution system')
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/lake.jpeg'),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'How Water Can Get Contaminated',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
            width: 400.0,
            height: 200.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Effects of Drinking Unclean Water'),
                      content: Wrap(
                        children: const [
                          Text(
                              'Microbiologically contaminated drinking water can transmit diseases such as:\n      - Diarrhoea\n      - Cholera\n      - Dysentery\n      - Typhoid\n      - Polio\nIt is estimated to cause 485 000 diarrhoeal deaths each year.')
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/reserve.jpeg'),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Effects of Drinking Unclean Water',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
