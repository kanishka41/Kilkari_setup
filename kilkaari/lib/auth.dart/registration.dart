// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:kilkaari/routes.dart';

class Registerscr extends StatefulWidget {
  const Registerscr({super.key});

  @override
  State<Registerscr> createState() => _RegisterscrState();
}

class _RegisterscrState extends State<Registerscr> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleloginuser() async {
    Map<String, dynamic> request = {
      "email": emailController.text,
      "password": passwordController.text
    };

    String jsonString = jsonEncode(request);
    final uri = Uri.parse('http://192.168.1.4:3000/auth/register');

    try {
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonString);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Login successfull');
        Navigator.pushNamed(context, AppRouters.stage);
      }
    } catch (error) {
      Fluttertoast.showToast(msg: 'Try again');
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Nice to see you!',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const Text('Create your account'),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: emailController,
                onChanged: (value) => emailController,
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
                onChanged: (value) => passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'password'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Confirm password'),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => {handleloginuser()},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(11, 121, 151, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    'Create Acccount',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
