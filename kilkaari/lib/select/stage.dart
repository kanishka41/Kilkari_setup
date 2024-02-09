import 'package:flutter/material.dart';
import 'package:kilkaari/routes.dart';

class Stagescr extends StatefulWidget {
  const Stagescr({super.key});

  @override
  State<Stagescr> createState() => _StagescrState();
}

class _StagescrState extends State<Stagescr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Kilkaari",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Container(
                  height: 150,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 179, 214, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('./assets/images/img2.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'I am pregent',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRouters.nextpage),
                              child: const Text("Next"))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 179, 214, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('./assets/images/img2.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'I am pregent',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                AppRouters.chatapp;
                              },
                              child: const Text("Next"))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 179, 214, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('./assets/images/img2.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'We mom',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRouters.chatapp),
                              child: const Text("Next")),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
      backgroundColor: const Color.fromRGBO(11, 121, 151, 1),
    );
  }
}
