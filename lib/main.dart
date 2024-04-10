import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.white,
            secondary: Colors.grey,
            tertiary: const Color.fromARGB(255, 147, 230, 150)),
        useMaterial3: true,
      ),
      home: const ChatPage(title: 'Receiver AAA'),
    );
  }
}
