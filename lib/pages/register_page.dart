import 'package:chat_app/components/form_textfield.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController userNameTextfieldController =
      TextEditingController();
  final TextEditingController emailTextfieldController =
      TextEditingController();
  final TextEditingController passwordTextfieldController =
      TextEditingController();

  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void userRegister() async {
    // Show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // User register
    try {
      // Create a new user by email and password
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailTextfieldController.text,
              password: passwordTextfieldController.text);

      // Create a new document for the user
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': userNameTextfieldController.text,
        'email': emailTextfieldController.text,
      });

      // Pop loading circle
      if (context.mounted) {
        Navigator.pop(context);
        successDialog();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorSnackBar(e.code);
    }
  }

  void errorSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void successDialog() {
    final alertDialog = AlertDialog(
      title: const Text('Welcome! :)'),
      content: const Text('Register successful!'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            )),
      ],
      elevation: 24.0,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.7,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: screenWidth * 0.067,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Nice to meet you! Have fun :)",
                  style: TextStyle(
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 134, 134, 134)),
                ),
                SizedBox(height: screenHeight * 0.035),
                Container(
                    width: screenWidth * 0.65,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(7.5),
                        border: Border.all(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            width: 2.0)),
                    child: FormTextfield(
                      textfieldController: userNameTextfieldController,
                      hintText: "User Name",
                      isPassword: false,
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                    width: screenWidth * 0.65,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(7.5),
                        border: Border.all(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            width: 2.0)),
                    child: FormTextfield(
                      textfieldController: emailTextfieldController,
                      hintText: "Email",
                      isPassword: false,
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                    width: screenWidth * 0.65,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(7.5),
                        border: Border.all(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            width: 2.0)),
                    child: FormTextfield(
                      textfieldController: passwordTextfieldController,
                      hintText: "Password",
                      isPassword: true,
                    )),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                SizedBox(
                  width: screenWidth * 0.65,
                  height: screenHeight * 0.05,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        side: BorderSide(
                            width: 2.0,
                            color: Theme.of(context).colorScheme.tertiary)),
                    onPressed: userRegister,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          color: const Color.fromARGB(255, 134, 134, 134)),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: const Color.fromARGB(255, 134, 134, 134),
                  indent: screenWidth * 0.075,
                  endIndent: screenWidth * 0.075,
                  height: screenHeight * 0.075,
                ),
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: screenWidth * 0.031,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 134, 134, 134)),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                SizedBox(
                  width: screenWidth * 0.65,
                  height: screenHeight * 0.05,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
