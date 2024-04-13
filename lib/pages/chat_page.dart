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

  final TextEditingController inputController = TextEditingController();

  // final messages = [
  //   "Hello World",
  //   "This is a 2 lines long message",
  //   "This is a very long message that divides the message into 3 lines"
  // ];

  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
                itemCount: messageList.length,
                padding: EdgeInsets.only(
                    top: screenHeight * 0.016, bottom: screenHeight * 0.085),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return MessageBox(
                      isSelf: messageList[index].isSelf,
                      message: messageList[index].text,
                      time: messageList[index].time);
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.07,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.036,
                    horizontal: screenHeight * 0.010),
                child: Container(
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219),
                          width: 3.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth * 0.024,
                      ),
                      Expanded(
                          child: TextField(
                        controller: inputController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 22.0, height: 1),
                        cursorColor: Colors.black,
                        cursorWidth: 2.5,
                        decoration: const InputDecoration(
                            hintText: "Input message here",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 173, 173, 173),
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal),
                            border: InputBorder.none),
                      )),
                      IconButton(
                        icon: const Icon(Icons.send),
                        iconSize: 25.0,
                        color: const Color.fromARGB(255, 138, 138, 138),
                        onPressed: () {
                          DateTime nowTime = DateTime.now().toLocal();
                          String nowTimeStr =
                              "${nowTime.hour}:${nowTime.minute}";
                          sendMessage(true, nowTimeStr, inputController.text);
                          inputController.clear();
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void sendMessage(bool isSelf, String time, String text) {
    Message newMessage = Message(isSelf, time, text);

    setState(() {
      messageList.add(newMessage);
    });
  }
}
