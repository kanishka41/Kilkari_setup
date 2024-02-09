

class Message {
  String message;
  String sendbyme;

  Message({required this.message,required this.sendbyme});

  factory Message.fromjson(Map<String ,dynamic> json){
    return Message(message: json['text'], sendbyme: json["sendbyme"]??'');
  }
}
