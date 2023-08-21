import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note/main.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool register = false;
  bool showPassword = true;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();

  bool _isNotValidated = false;

  void userRegistration() async {
    if (registerEmail.text.isNotEmpty && registerPassword.text.isNotEmpty) {
      var regBody = {
        "email": registerEmail.text,
        "password": registerPassword.text,
      };

      var response = await http.post(
          Uri.parse("http://172.16.0.2:3200/registration"),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      debugPrint(">>>>>>>>>>------");
      print(response);
      print(jsonResponse["success"]);
      if (jsonResponse["success"]) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      }else {
        print("Something went wrong. Please try again");
      }
    } else {
      debugPrint(">>>>>>>>>>");
      debugPrint("Error");
      setState(() {
        _isNotValidated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: register == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Please sign in to your account",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: loginEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              fillColor: const Color.fromARGB(31, 95, 105, 48),
                              filled: true,
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: loginPassword,
                          obscureText: showPassword,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(31, 95, 105, 48),
                              filled: true,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: showPassword
                                    ? const Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        color: Colors.black38,
                                        size: 20,
                                      )
                                    : const Icon(
                                        FontAwesomeIcons.eye,
                                        color: Colors.black38,
                                        size: 20,
                                      ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 180),
                          child: TextButton(
                              onPressed: null,
                              child: Text(
                                "Forget Password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 60),
                                backgroundColor:
                                    const Color.fromARGB(255, 142, 169, 192),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (_isNotValidated == false) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    register = true;
                                  });
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 109, 174, 228),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Create new account",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Please fill in the form to continue",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: registerEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              fillColor: const Color.fromARGB(31, 95, 105, 48),
                              filled: true,
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: registerPassword,
                          obscureText: showPassword,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(31, 95, 105, 48),
                              filled: true,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: showPassword
                                    ? const Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        color: Colors.black38,
                                        size: 20,
                                      )
                                    : const Icon(
                                        FontAwesomeIcons.eye,
                                        color: Colors.black38,
                                        size: 20,
                                      ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 60),
                                backgroundColor:
                                    const Color.fromARGB(255, 142, 169, 192),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              userRegistration();
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    register = false;
                                  });
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 109, 174, 228),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
        ),
      )),
    );
  }
}
