import 'package:chat_app/components/message_box.dart';
import 'package:flutter/material.dart';

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
      body: Center(
          child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.036),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return MessageBox(
                    isSelf: index % 2 == 1 ? true : false, message: messages[1], time: "13:55");
              })),
    );
  }
}

// Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               height: screenWidth * 0.036,
//             ),
//             MessageBox(isSelf: false, message: messages[0], time: "15:20"),
//             MessageBox(isSelf: true, message: messages[1], time: "15:20"),
//             MessageBox(isSelf: false, message: messages[2], time: "15:20"),
//             MessageBox(isSelf: true, message: messages[0], time: "15:20"),
//             MessageBox(isSelf: false, message: messages[1], time: "15:20")
//           ],
//         ),