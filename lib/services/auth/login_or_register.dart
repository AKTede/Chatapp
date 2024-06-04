import 'package:chat_app_test/pages/login_page.dart';
import 'package:chat_app_test/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister ({super.key});
  @override
  State<StatefulWidget> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially, show login pafe
  bool showLoginPage = true;
  //toogle
  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: tooglePages,
      );
    }
    else {
      return RegisterPage(
        onTap: tooglePages,
      );
    }
  }
}