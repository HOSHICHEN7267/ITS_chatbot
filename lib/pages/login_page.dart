import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Center(
        child: Container(
          width: screenWidth * 0.8,
          height: screenHeight * 0.7,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.065,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              // Email field
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                  width: screenWidth * 0.65,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 216, 216, 216),
                          width: 2.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth * 0.024,
                      ),
                      const Expanded(
                          child: TextField(
                        // controller: inputController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 18.0, height: 1.2),
                        cursorColor: Colors.black,
                        cursorWidth: 2.5,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 134, 134, 134),
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal),
                            border: InputBorder.none),
                      ))
                    ],
                  )),
              // Password field

              // Login button

              // Don't have an account? Signup

              // Or

              // Login with Google button
            ],
          ),
        ),
      ),
    );
  }
}
