import 'package:flutter/material.dart';

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({super.key, required this.question, required this.answer});

  @override
  // ignore: library_private_types_in_public_api
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8.0, // Add a small shadow
      child: Card(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(  
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 51, 60, 122),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              ),
              child: ListTile(
                title: Text(
                  widget.question,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 239, 236, 236),
                  ),
                ),
                trailing: IconButton(
                  icon: _isOpen ? Image.asset("assets/icon_up.png") : Image.asset("assets/icon_down.png"),
                  onPressed: () {
                    setState(() {
                      _isOpen = !_isOpen;
                      if (_isOpen) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: _animation.value * (_isOpen ? 90.0 : 0.0),
              child: Opacity(
                opacity: _animation.value,
                child: Container(
                   decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 77, 87, 156),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 77, 87, 156),
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0),
                        ),
                      ],
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(widget.answer,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 239, 236, 236)
                          )
                        ),
                    )
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}