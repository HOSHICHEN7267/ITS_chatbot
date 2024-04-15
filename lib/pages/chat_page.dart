import 'package:chat_app/components/message_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Message {
  bool isSelf;
  String time;
  String text;

  Message(this.isSelf, this.time, this.text);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController inputController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  List<Message> messageList = [];
  bool isInputSelf = true;

  void userLogout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(user.email!),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
          actions: [
            IconButton(onPressed: userLogout, icon: const Icon(Icons.logout)),
          ],
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
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.account_circle,
                        ),
                        iconSize: 40.0,
                        color: isInputSelf ? Colors.grey : Colors.black,
                        onPressed: () {
                          setState(() {
                            isInputSelf = !isInputSelf;
                          });
                        },
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Container(
                        height: screenHeight * 0.055,
                        width: screenWidth * 0.8,
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
                              style: const TextStyle(fontSize: 22.0, height: 1),
                              cursorColor: Colors.black,
                              cursorWidth: 2.5,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
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
                                sendMessage(isInputSelf, nowTimeStr,
                                    inputController.text);
                                inputController.clear();
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
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
