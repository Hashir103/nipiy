import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class WaterAnimation extends StatefulWidget {
  const WaterAnimation({Key? key}) : super(key: key);

  @override
  WaterAnimationState createState() => WaterAnimationState();
}

class WaterAnimationState extends State<WaterAnimation> {
  StateMachineController? controller;
  SMIInput<double>? valueInput;
  ValueNotifier<double> valueNotifier = ValueNotifier(0.0);
  double? waterValue;

  void updateValue(double newValue) {
    setState(() {
      valueInput?.change(newValue);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 300,
              width: 150,
              child: RiveAnimation.asset("assets/water_bar_demo.riv",
              alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover, onInit: (artboard) {
                controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");

                if (controller == null) return;
                artboard.addController(controller!);

                valueInput = controller?.findInput("Level");
              })),
        ]);
  }
}
