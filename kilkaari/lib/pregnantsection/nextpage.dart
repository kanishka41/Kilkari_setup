import 'package:flutter/material.dart';
import 'package:kilkaari/pregnantsection/Pregnancy_second.dart';
// import 'package:into_page/pages/Pregnancy_second.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _name = '';
  String _age = '';
  String _pregnancyStatus = 'No';
  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "About you",
                    style: TextStyle(
                      fontSize: screenWidth > 600
                          ? 36
                          : 24, // Adjust font size for larger screens
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " 💁🏻‍♀️",
                    style: TextStyle(
                      fontSize: screenWidth > 600
                          ? 56
                          : 40, // Adjust font size for larger screens
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                "Your Name",
                style: TextStyle(
                  fontSize: screenWidth > 600
                      ? 24
                      : 18, // Adjust font size for larger screens
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(
                  color: Colors.black, // Text color
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                    _validateForm();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Border color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 255, 255, 255), // Background color
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Your Age",
                style: TextStyle(
                  fontSize: screenWidth > 600
                      ? 24
                      : 18, // Adjust font size for larger screens
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(
                  color: Colors.black, // Text color
                ),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                    _validateForm();
                  });
                },
                keyboardType: TextInputType.number, // Allows only numeric input
                decoration: InputDecoration(
                  hintText: "Enter your age",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Border color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 255, 255, 255), // Background color
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Are you pregnant?",
                style: TextStyle(
                  fontSize: screenWidth > 600
                      ? 24
                      : 18, // Adjust font size for larger screens
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: _pregnancyStatus,
                onChanged: (newValue) {
                  setState(() {
                    _pregnancyStatus = newValue.toString();
                    _validateForm();
                  });
                },
                items: ['Yes', 'No']
                    .map((pregnancyStatus) => DropdownMenuItem(
                          child: Text(pregnancyStatus),
                          value: pregnancyStatus,
                        ))
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Border color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 255, 255, 255), // Background color
                ),
              ),
              SizedBox(height: 150),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed:
                      _isFormValid ? () => _continuePressed(context) : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Button color
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _name.isNotEmpty && _age.isNotEmpty;
    });
  }

  void _continuePressed(BuildContext context) {
    if (_isFormValid) {
      // Navigate to the Pregnancy_second page and pass the name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pregnancy_second(name: _name),
        ),
      );
    }
  }
}
