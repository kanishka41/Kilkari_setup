import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kilkaari/pregnantsection/fifth_page.dart';
import 'package:kilkaari/pregnantsection/first_page.dart';
import 'package:kilkaari/pregnantsection/fourth_page.dart';
import 'package:kilkaari/pregnantsection/help.dart';
import 'package:kilkaari/pregnantsection/pregnancy_profilepage.dart';
import 'package:kilkaari/pregnantsection/second_page.dart';
import 'package:kilkaari/pregnantsection/third_page.dart';

import 'pregnancy_likepage.dart';

class PregnancyDashboard extends StatefulWidget {
  final String name;
  final int currentWeek;

  PregnancyDashboard({required this.name, required this.currentWeek});

  @override
  _PregnancyDashboardState createState() => _PregnancyDashboardState();
}

class _PregnancyDashboardState extends State<PregnancyDashboard> {
  late DateTime estimatedDueDate;
  late Timer _timer;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.popUntil(context, (route) => route.isFirst);
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LikePage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    estimatedDueDate =
        DateTime.now().add(Duration(days: (40 - widget.currentWeek) * 7));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int remainingDays = _calculateRemainingDays(estimatedDueDate);
    int remainingWeeks = (remainingDays ~/ 7);
    String formattedDueDate =
        "${estimatedDueDate.day} ${_getMonthName(estimatedDueDate.month)} ${estimatedDueDate.year}";

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 70),
              Text(
                'Hello ${widget.name}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 104, 105, 105),
                ),
              ),
              SizedBox(height: 7),
              Text(
                '${widget.currentWeek}th Week of Pregnancy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 1000,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 167, 205),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset(
                            'assets/images/momdashboard.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Due Date $formattedDueDate',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Remaining Days $remainingDays',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Remaining Weeks: $remainingWeeks',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Icon (1).png',
                            ),
                            Text('Exercises'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/food.png',
                              height: 20,
                            ),
                            Text('Food'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdPage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/video.png',
                              height: 20,
                            ),
                            Text('video'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FourthPage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Icon (3).png',
                              height: 20,
                            ),
                            Text('Guide'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FifthPage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/hospital (1).png',
                              height: 20,
                            ),
                            Text('Hospital'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Help()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/call.png',
                              height: 20,
                            ),
                            Text('Help'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int _calculateRemainingDays(DateTime dueDate) {
    return dueDate.difference(DateTime.now()).inDays;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
