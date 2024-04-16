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
      body: ListView.builder(
          itemCount: friendList.length,
          padding: EdgeInsets.all(screenWidth * 0.026),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.account_circle, size: screenWidth * 0.104,),
              title: Text(friendList[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.042),),
              subtitle: Text("This is our latest message", style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.036),),
              trailing: Icon(Icons.navigate_next, size: screenWidth * 0.063,),
              onTap: (){},
            );
          }),
    );
  }
}
