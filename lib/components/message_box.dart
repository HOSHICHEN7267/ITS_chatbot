import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final bool isSelf;
  final String message;
  final String time;

  const MessageBox(
      {super.key,
      required this.isSelf,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    if (isSelf) {
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
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20.0)),
                  ),
                ],
              ),
            ],
          ));
    } else {
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
                SizedBox(
                  width: screenWidth * 0.012,
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
                          child: Text(message,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 3.5,
                    ),
                    Text(time,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w200)),
                  ],
                ),
              ]));
    }
  }
}
