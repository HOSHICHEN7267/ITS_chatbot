import 'package:flutter/material.dart';

class MessageOthers extends StatelessWidget {
  final String name;
  final String message;

  // Test message
  final messages = [
    "Hello World",
    "This is a 2 lines long message",
    "This is a very long message that divides the message into 3 lines"
  ];

  MessageOthers({super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.all(screenWidth * 0.036),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: screenWidth * 0.145,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.036),
                        constraints: BoxConstraints(
                          maxWidth: screenWidth * 0.655,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Text(messages[1],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20.0)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 3.5,),
                  const Text("time",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w100)),
                ],
              ),
            ]));
  }
}
