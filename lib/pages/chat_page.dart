import 'package:chat_app/components/message_box.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  final String receiverName;

  const ChatPage(
      {super.key,
      required this.receiverEmail,
      required this.receiverId,
      required this.receiverName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController inputController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final user = FirebaseAuth.instance.currentUser!;

  bool isInputSelf = true; // to delete

  void userLogout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  void sendMessage() async {
    if (inputController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverId, inputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.receiverName,
            style: TextStyle(fontSize: screenWidth * 0.047),
          ),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
        ),
        body: Stack(
          children: <Widget>[
            _buildMessageList(screenHeight),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  color: Theme.of(context).colorScheme.primary,
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: screenHeight * 0.055,
                    width: screenWidth * 0.9,
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
                          style: TextStyle(
                              fontSize: screenWidth * 0.049, height: 1),
                          cursorColor: Colors.black,
                          cursorWidth: 2.5,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0.0),
                              hintText: "Input message here",
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 173, 173, 173),
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.normal),
                              border: InputBorder.none),
                        )),
                        IconButton(
                          icon: const Icon(Icons.send),
                          iconSize: screenWidth * 0.056,
                          color: const Color.fromARGB(255, 138, 138, 138),
                          onPressed: () {
                            sendMessage();
                            inputController.clear();
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget _buildMessageList(double screenHeight) {
    return StreamBuilder(
        stream:
            _chatService.getMessages(widget.receiverId, _auth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading...'));
          }

          return ListView(
            padding: EdgeInsets.only(
                top: screenHeight * 0.016, bottom: screenHeight * 0.085),
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    bool self = (data['senderId'] == _auth.currentUser!.uid) ? true : false;

    final dateTime = data['timestamp'].toDate();
    final timeFormatter = DateFormat('HH:mm');
    final formattedTime = timeFormatter.format(dateTime);

    return MessageBox(
        isSelf: self, message: data['message'], time: formattedTime);
  }
}
