import 'package:flutter/material.dart';

class MessageSelf extends StatelessWidget {
  final String message;
  final String time;

  const MessageSelf({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.all(screenWidth * 0.036),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(time,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w200)),
            SizedBox(
              width: screenWidth * 0.012,
            ),
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
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Text(message,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0)),
                ),
              ],
            ),
          ],
        ));
  }
}
