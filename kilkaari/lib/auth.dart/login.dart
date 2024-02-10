// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:kilkaari/routes.dart';

class Loginscr extends StatefulWidget {
  const Loginscr({super.key});

  @override
  State<Loginscr> createState() => _LoginscrState();
}

class _LoginscrState extends State<Loginscr> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handlesigninuser() async {
    Map<String, dynamic> request = {
      "email": emailController.text,
      "password": passwordController.text
    };

    String jsonString = json.encode(request);
    final uri = Uri.parse("https://kilkaariserver.onrender.com/auth/login");
    print(jsonString);

    try {
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonString);
      print('Response from server: ${response.body}');
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Login successfull');
        
        Navigator.pushNamedAndRemoveUntil(
            context, AppRouters.stage, (route) => true);
      }
      if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: 'try again');
      }
    } catch (error) {
      Fluttertoast.showToast(msg: 'Try again');
      print("not");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Hello Again',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const Text('Log into your account'),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: const Icon(Icons.visibility),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'password'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180, top: 10),
              child: GestureDetector(
                child: const Text(
                  'Forget Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => {handlesigninuser()},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(11, 121, 151, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
