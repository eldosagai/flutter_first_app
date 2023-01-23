import 'package:first_app/services/auth/auth_exceptions.dart';
import 'package:first_app/services/auth/auth_service.dart';
import 'package:first_app/utilities/show_error_dialog.dart';
import 'package:first_app/view/login.dart';
import 'package:first_app/view/verify_email.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

// import 'package:flutter/widgets.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text("Lol kek"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter your email here",
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "Enter your password here",
              ),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;

                try {
                  final userkek = await AuthService.firebase()
                      .createUser(email: email, password: password);
                  devtools.log(userkek.toString());
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerifyEmailView()));
                } on WeakPasswordAuthException {
                  await showErrorDialog(context, "Weak password");
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, "Invalid email");
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(context, "Email already in use");
                } on GenericAuthException{
                  await showErrorDialog(context, "Register failed");
                }
              },
              child: const Text('Register'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: ((context) => const LoginView())),
                      (route) => false);
                },
                child: const Text("Already registered? Login here!"))
          ],
        ));
  }
}
