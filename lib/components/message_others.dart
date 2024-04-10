import 'package:flutter/material.dart';

class MessageOthers extends StatelessWidget {
  final String name;
  final String message;

  MessageOthers({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        color: Theme.of(context).colorScheme.tertiary,
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Column(
        //       children: [
        //         Icon(
        //           Icons.account_circle_rounded,
        //           color: Colors.black,
        //         )
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
