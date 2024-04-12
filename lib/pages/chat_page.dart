import 'package:chat_app/components/message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Message {
  bool isSelf;
  String time;
  String text;

  Message(this.isSelf, this.time, this.text);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Test message

  // List<Message> messages = [];

  final messages = [
    "Hello World",
    "This is a 2 lines long message",
    "This is a very long message that divides the message into 3 lines"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.symmetric(vertical: screenWidth * 0.036),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return MessageBox(
                      isSelf: index % 2 == 1 ? true : false,
                      message: messages[1],
                      time: "13:55");
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 0.036, horizontal: screenWidth * 0.024),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 3.0)
                  ),

                ),
              ),
            )
          ],
        ));
  }
}
