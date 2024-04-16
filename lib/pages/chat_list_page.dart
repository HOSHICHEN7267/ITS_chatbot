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

  final friendList = [
    "Antony",
    "Apple",
    "Dubi",
    "Jacob",
    "Noah",
    "Tina",
    "Lucas",
    "Avery",
    "Elsa",
    "Freddy"
  ];

  void userLogout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.052),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Text(
                "Friends",
                style: TextStyle(
                    fontSize: screenWidth * 0.068, fontWeight: FontWeight.bold),
              ),
              Text(
                user.email!,
                style: TextStyle(fontSize: screenWidth * 0.036),
              ),
            ],
          ),
        ),
        // shape: const Border(bottom: BorderSide(color: Colors.grey, width: 3)),
        actions: [
          IconButton(
            onPressed: userLogout,
            icon: const Icon(Icons.logout),
            iconSize: screenWidth * 0.07,
            padding: EdgeInsets.only(right: screenWidth * 0.052),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: friendList.length,
          padding: const EdgeInsets.all(10.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(friendList[index]),
              subtitle: const Text("This is our latest message"),
              trailing: Icon(Icons.navigate_next),
            );
          }),
    );
  }
}
