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
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 65.0,
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15.0),
                constraints: const BoxConstraints(
                  maxWidth: 250,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Text(messages[1],
                    style:
                        const TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
            ],
          ),
        ]));
  }
}
