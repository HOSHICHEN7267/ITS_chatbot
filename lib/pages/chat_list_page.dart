import 'package:chat_app/pages/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    await _auth.signOut();
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
        toolbarHeight: screenHeight * 0.149,
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
        actions: [
          IconButton(
            onPressed: userLogout,
            icon: const Icon(Icons.logout),
            iconSize: screenWidth * 0.07,
            padding: EdgeInsets.all(screenWidth * 0.052),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
              children: snapshot.data!.docs
                  .map<Widget>((doc) =>
                      _buildFriendListItem(doc, screenWidth, screenHeight))
                  .toList(),
            );
          }),
    );
  }

  Widget _buildFriendListItem(
      DocumentSnapshot document, double screenWidth, double screenHeight) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // Display all users except current user
    if (user.email != data['email']) {
      return ListTile(
        leading: Icon(
          Icons.account_circle,
          size: screenWidth * 0.104,
        ),
        title: Text(
          data['name'],
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: screenWidth * 0.042),
        ),
        subtitle: Text(
          "This is our latest message",
          style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.036),
        ),
        trailing: Icon(
          Icons.navigate_next,
          size: screenWidth * 0.063,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEmail: data['email'],
                        receiverId: data['uid'],
                        receiverName: data['name'],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
