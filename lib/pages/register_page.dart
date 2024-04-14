import 'package:chat_app/components/form_textfield.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailTextfieldController =
      TextEditingController();
  final TextEditingController passwordTextfieldController =
      TextEditingController();
  final TextEditingController confirmPasswordTextfieldController =
      TextEditingController();

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
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.015),
                const Text(
                  "Nice to meet you! Have fun :)",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 134, 134, 134)),
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
                      textfieldController: confirmPasswordTextfieldController,
                      hintText: "Confirm Password",
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
                    onPressed: () {},
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 134, 134, 134)),
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
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 134, 134, 134)),
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
                          fontSize: 18.0,
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
