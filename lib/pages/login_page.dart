import 'package:chat_app/components/form_textfield.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailTextfieldController =
      TextEditingController();
  final TextEditingController passwordTextfieldController =
      TextEditingController();

  void userLogin() async {
    // Show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // User login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextfieldController.text,
          password: passwordTextfieldController.text);
      // Pop loading circle
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'invalid-credential') {
        errorSnackBar('OOPS! Invalid Email or Password');
      } else {
        errorSnackBar(e.code);
      }
    }
  }

  void errorSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint("width: $screenWidth, height: $screenHeight");

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
                  "Login",
                  style: TextStyle(
                      fontSize: screenWidth * 0.067,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Welcome Back :)",
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
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    onPressed: () {
                      userLogin();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPage()));
                    },
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
                  height: screenHeight * 0.085,
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
                      onPressed: () => AuthService().signInWithGoogle(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/GoogleIcon.png',
                            scale: screenWidth / 448,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                                fontSize: screenWidth * 0.040,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
