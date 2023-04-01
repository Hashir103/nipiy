import 'package:flutter/cupertino.dart';
import 'package:nipiy/widgets/faqcard.dart';

import '../widgets/app_header.dart';
import '../widgets/app_text.dart';

class FAQWidget extends StatelessWidget {
  const FAQWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppText(textValue: "Welcome to"),
      const AppHeaderText(
        textValue: "FAQ",
        textColor: Color.fromARGB(255, 82, 107, 172),
      ),
      SizedBox(
          width: 250,
          child: AppText(
              textValue:
                  "Some commonly asked questions for our platform answered here!",
              textSize: 15,
              textColor: const Color(0xFF878593))),
      const SizedBox(height: 25),
      const SizedBox(
          width: 325,
          child: FAQCard(
            question: "🌱 - What advantages do I get from using Nipiy?",
            answer:
                "Nipiy provides up-to-date map tracking to safe clean water advisories, a water inventory system, and resources promoting clean water.",
          )),
      const SizedBox(height: 20),
      const SizedBox(
          width: 325,
          child: FAQCard(
            question: "📙 - How can I trust that Nipiy is not using my data?",
            answer:
                "Nipiy currently stores zero data, and vows to only store future data on the phone's local storage; no accounts, no passwords, no data.",
          )),
      const SizedBox(height: 20),
      const SizedBox(
          width: 325,
          child: FAQCard(
            question: "📈 - Where does Nipiy get its map information from?",
            answer: "Nipiy gets all of its data from the Government of Canada and only cites the most credible sources.",
          )),
    ]);
  }
}
