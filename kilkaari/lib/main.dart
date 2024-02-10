// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kilkaari/getPermissions.dart';
import 'package:kilkaari/routes.dart';
import 'dbConnection.dart';

Future<void> main() async {
  await dbConnection.connect();
  print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuuuuulllll");
  // bool permissionsGranted = await PermissionHandler.requestPermissions();
  // if (permissionsGranted) {
  //   // Permissions granted, proceed with your functionality
  //   print('Permissions granted');
  // } else {
  //   // Permissions not granted, handle accordingly
  //   print('Permissions not granted');
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouters.splashscr,
      routes: AppRouters.routes,
    );
  }
}
