import 'package:first_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  devtools.log(userCredential.toString());
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    devtools.log("Weak password");
                  } else if (e.code == 'email-already-in-use') {
                    devtools.log("Email already in use");
                  } else if (e.code == 'invalid-email') {
                    devtools.log("Invalid email");
                  }
                }
              },
              child: const Text('Register'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginView();
                  }));
                },
                child: const Text("Already registered? Login here!"))
          ],
        ));
  }
}
