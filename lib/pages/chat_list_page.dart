import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  // Current user instance of Firebase
  final user = FirebaseAuth.instance.currentUser!;

  void userLogout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(user.email!, style: TextStyle(fontSize: screenWidth * 0.047),),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
          actions: [
            IconButton(
              onPressed: userLogout,
              icon: const Icon(Icons.logout),
              iconSize: screenWidth * 0.054,
            ),
          ],
        ),
      body: const Placeholder(),
    );
  }
}