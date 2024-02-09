import 'package:kilkaari/routes.dart';

List<User> userlist = [
  User(
      image: './assets/images/img2.png',
      text: 'I am Pregnant',
      path: AppRouters.predash),
  User(
      image: './assets/images/img1.png',
      text: 'I am Mother',
      path: AppRouters.predash),
  User(
      image: './assets/images/img2.png',
      text: 'We Women',
      path: AppRouters.chatapp),
];

class User {
  final String image;
  final String text;
  final String path;

  // Constructor
  User({required this.image, required this.text, required this.path});
}
