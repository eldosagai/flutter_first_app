import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/view/login.dart';
import 'package:first_app/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verify email"),
        ),
        body: Column(
          children: [
            const Text("We've sent you an email verification"),
            const Text(
                "If yo haven't received a verification email yet, press the button below"),
            TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                },
                child: const Text('Send verification email')),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                      (route) => false);
                },
                child: const Text("Restart"))
          ],
        ));
  }
}
