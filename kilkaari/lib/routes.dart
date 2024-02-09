import 'package:flutter/material.dart';
import 'package:kilkaari/auth.dart/login.dart';
import 'package:kilkaari/auth.dart/registration.dart';
import 'package:kilkaari/auth.dart/splash.dart';
import 'package:kilkaari/pregnantsection/nextpage.dart';
import 'package:kilkaari/pregnantsection/dashboard.dart';
import 'package:kilkaari/select/stage.dart';
import 'package:kilkaari/we_women/chat.dart';

class AppRouters {
  static const String loginScr = '/login';
  static const String registerscr = '/registration';
  static const String splashscr = '/splash';
  static const String stage = '/stage';
  static const String predash = '/dashboard';
  static const String chatapp = '/chat';
  static const String nextpage = '/nextpage';

  static Map<String, WidgetBuilder> get routes => {
        loginScr: (context) => const Loginscr(),
        registerscr: (context) => const Registerscr(),
        splashscr: (context) => const Splashscr(),
        stage: (context) => const Stagescr(),
        predash: (context) => const PreDashboard(),
        chatapp: (context) => const Chatscr(),
        nextpage: (context) => NextPage(),
      };
}
