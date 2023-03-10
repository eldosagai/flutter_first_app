import 'package:first_app/services/auth/auth_exceptions.dart';
import 'package:first_app/services/auth/auth_service.dart';
import 'package:first_app/view/register_view.dart';
import 'package:first_app/view/verify_email.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../utilities/show_error_dialog.dart';
import 'notes/notes_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kek lol"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: "Enter your email here"),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: "Enter your password here"),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase().logIn(
                      email: email, password: password);
                  final user = AuthService.firebase().currentUser;
                  if (user?.isEmailVerified ?? false) {
                  // user email is verified  
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const NotesView()),
                        (route) => false);
                  } else{
                    //user email is NOT verified
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const VerifyEmailView()),
                        (route) => false);
                  }
                } on UserNotFoundAuthException{
                    await showErrorDialog(context, "User not found");
                } on WrongPasswordAuthException{
                    await showErrorDialog(context, "Wrong password");
                } on GenericAuthException{
                  await showErrorDialog(context, "Authentication error");
                }
              },
              child: const Text('Sign in'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: ((context) => const RegisterView())),
                      (route) => false);
                },
                child: const Text('Not registered? Register here'))
          ],
        ));
  }
}
