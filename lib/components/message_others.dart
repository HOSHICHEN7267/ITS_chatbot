import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageOthers extends StatelessWidget {
  final String name;
  final String message;

  // Test message
  final messages = ["Hello World"];

  MessageOthers({required this.name, required this.message});

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
                  maxWidth: 300,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Text(messages[0],
                    style:
                        const TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
            ],
          ),
        ]));
  }
}
