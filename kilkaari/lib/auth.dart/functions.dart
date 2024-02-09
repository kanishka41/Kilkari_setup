import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void handleloginuser(emailController, passwordController) async {
  Map<String, dynamic> request = {
    "email": emailController,
    "password": passwordController
  };
  final uri = Uri.parse('10.0.2.2:8000/auth/register');
  try {
    final response = await http.post(uri, body: request);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Login in successfull');
      print("done");
    }
  } catch (error) {
    Fluttertoast.showToast(msg: 'email or password is incoorect');
  }
}
