import 'package:flutter/material.dart';
import 'package:kilkaari/pregnantsection/pregnancy_dashboard.dart';

class Pregnancy_second extends StatefulWidget {
  final String name; // Add name parameter

  const Pregnancy_second({Key? key, required this.name}) : super(key: key);

  @override
  _Pregnancy_secondState createState() => _Pregnancy_secondState();
}

class _Pregnancy_secondState extends State<Pregnancy_second> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.name}!", // Use widget.name
                      style: TextStyle(
                        fontSize: screenWidth > 600
                            ? 36
                            : 24, // Adjust font size for larger screens
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5), // Adjust the height as needed
                    Text(
                      "Set your due date", // Add missing double quote
                      style: TextStyle(
                        fontSize: screenWidth > 600
                            ? 36
                            : 24, // Adjust font size for larger screens
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10), // Add a SizedBox
                Text(
                  " 👶",
                  style: TextStyle(
                    fontSize: screenWidth > 600
                        ? 56
                        : 40, // Adjust font size for larger screens
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              "  Your first step towards a Happy Pregnancy",
              style: TextStyle(
                fontSize: screenWidth > 600
                    ? 20
                    : 15, // Adjust font size for larger screens
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "  Based on First day of last period",
              style: TextStyle(
                fontSize: screenWidth > 600
                    ? 24
                    : 18, // Adjust font size for larger screens
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30), // Add some space
            Flexible(
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context); // Pass context here
                },
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "We calculate estimated due date using a 28-day menstrual cycle.",
              style: TextStyle(
                fontSize: screenWidth > 600
                    ? 20
                    : 15, // Adjust font size for larger screens
                color: Colors.black,
              ),
            ),
            Expanded(
              child: SizedBox(), // Spacer to push the button to the bottom
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  _showBottomSheet(); // Show bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: screenWidth > 600
                        ? 24
                        : 18, // Adjust font size for larger screens
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, // Pass context here
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // Use setState from the State object to update the UI
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  void _showBottomSheet() {
    DateTime? selectedDate = DateTime.tryParse(_dateController.text);
    if (selectedDate != null) {
      // Calculate estimated due date
      DateTime estimatedDueDate = selectedDate.add(Duration(days: 280));

      // Calculate current week and remaining weeks
      DateTime currentDate = DateTime.now();
      int currentWeek =
          ((currentDate.difference(selectedDate).inDays) / 7).floor();

      // Ensure currentWeek is a positive integer
      currentWeek = currentWeek.abs();

      int remainingWeeks =
          ((estimatedDueDate.difference(currentDate).inDays) / 7).floor();

      // Construct congratulatory message
      String congratulatoryMsg = "Congratulations! "
          "Your estimated due date is ${estimatedDueDate.toString().split(" ")[0]}."
          " You are currently in week $currentWeek of your pregnancy,"
          " with $remainingWeeks weeks remaining.";

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    congratulatoryMsg,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the PregnancyDashboard page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PregnancyDashboard(
                            name: widget.name, // Pass the name here
                            currentWeek: currentWeek,
                          ),
                        ),
                      );
                    },
                    child: Text('Set'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Show error message if date is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a date first.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
