import 'package:chat_app_test/services/auth/auth_service.dart';
import 'package:chat_app_test/components/my_button.dart';
import 'package:chat_app_test/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;
  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }
    //catch any errors
    catch (e) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString())
        )
      );
    }
  }
  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message, 
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50,),
            //welcome back message
            Text(
              "Ravi de vous revoir !",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              )
            ),
            const SizedBox(height: 25,),
            //email textfield
            MyTextField(
              controller: _emailController,
              obscureText: false,
              hintText: "Email",
            ),
            const SizedBox(height: 10,),
            //pw textfield
            MyTextField(
              controller: _pwController,
              obscureText: true,
              hintText: "Mot de passe",
            ),
            const SizedBox(height: 25,),
            //login button
            MyButton(
              text: "Suivant",
              onTap: () => login(context),
            ),
            const SizedBox(height: 25,),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pas de compte ? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Créer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}