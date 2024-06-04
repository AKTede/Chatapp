import 'package:chat_app_test/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_test/components/my_button.dart';
import 'package:chat_app_test/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;
  //register method
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();
    //password match create user
    // ignore: unrelated_type_equality_checks
    if (_pwController.text != _confirmPwController) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString())));
      }
    }
    //password dont match show error
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
              title: Text("Les mots de passe ne correspondent pas...")));
    }
  }

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
            const SizedBox(
              height: 50,
            ),
            //welcome back message
            Text("Bienvenue !",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 25,
            ),
            //email textfield
            MyTextField(
              controller: _emailController,
              obscureText: false,
              hintText: "Email",
            ),
            const SizedBox(
              height: 10,
            ),
            //pw textfield
            MyTextField(
              controller: _pwController,
              obscureText: true,
              hintText: "Mot de passe",
            ),
            const SizedBox(
              height: 10,
            ),
            //confirm pw textfield
            MyTextField(
              controller: _confirmPwController,
              obscureText: true,
              hintText: "Confirmer le mot de passe",
            ),
            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              text: "Suivant",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vous avez un compte? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
