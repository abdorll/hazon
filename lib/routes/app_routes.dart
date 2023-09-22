import 'package:flutter/material.dart'; 
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/views/login_screen/login_screen.dart';
import 'package:hazon/views/page_not_found.dart';
import 'package:hazon/views/signup_screen/signup_screen.dart';
import 'package:hazon/widget/texts.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.loginScreen:
        return screenOf(screenName: const LoginScreen());
      case SignupScreen.signupScreen:
        return screenOf(screenName: const SignupScreen());
      default:
        return screenOf(screenName: const PageNotFound());
    }
  }
}

MaterialPageRoute screenOf({required Widget screenName}) {
  return MaterialPageRoute(builder: (context) => screenName);
}
