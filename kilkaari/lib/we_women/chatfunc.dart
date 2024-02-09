import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBody extends StatelessWidget {
  // const Messagebody({super.key, required this.sendbyme});
  MessageBody({Key? key, required this.sendbyme, required this.message})
      : super(key: key);

  final bool sendbyme;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sendbyme ? Alignment.bottomRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: sendbyme ? Colors.blue : Colors.blueGrey,
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(mainAxisSize: MainAxisSize.min,children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ]),
        ),
      ),
    );
  }
}
