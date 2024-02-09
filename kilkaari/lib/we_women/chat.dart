import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilkaari/we_women/chatfunc.dart';
import 'package:kilkaari/we_women/controller/chatcontroller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'models/message.dart';

class Chatscr extends StatefulWidget {
  const Chatscr({super.key});

  @override
  State<Chatscr> createState() => _ChatscrState();
}

class _ChatscrState extends State<Chatscr> {
  TextEditingController messagehandlercontroller = TextEditingController();
  chatcontroller chatappcontroller = chatcontroller();
  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io(
      'http://192.168.1.4:3000',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    startupmessage();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 121, 151, 1),
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: Obx(() => ListView.builder(
                  itemCount: chatappcontroller.chatmessage.length,
                  itemBuilder: (context, index) {
                    var currentItem = chatappcontroller.chatmessage[index];
                    return MessageBody(
                      sendbyme: true,
                      message: currentItem.message,
                    );
                  }))),

          //Message bar
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: messagehandlercontroller,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          sendmessage(messagehandlercontroller.text);
                          messagehandlercontroller.clear();
                        },
                      ),
                    ),
                  ),
                  hintText: 'Message',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white))),
            ),
          ))
        ],
      ),
    );
  }

  void sendmessage(String text) {
    var jsonformate = {"text": text, "sendbyme": socket.id};
    socket.emit('message', jsonformate);
    print(jsonformate);
    chatappcontroller.chatmessage.add(Message.fromjson(jsonformate));
  }

  void startupmessage() {
    socket.on('message-receive', (dynamic data) {
      if (data is Map<String, dynamic>) {
        String? text = data['text']; // Access 'text' field, which might be null
        String sendbyme =
            data['sendbyme'] ?? ''; // Use a default value if 'sendbyme' is null

        if (text != null) {
          chatappcontroller.chatmessage.add(Message.fromjson(data));
          print('Received message: $text from $sendbyme');
        } else {
          print('Invalid data format: $data');
        }
      } else {
        print('Invalid data format: $data');
      }
    });
  }
}
