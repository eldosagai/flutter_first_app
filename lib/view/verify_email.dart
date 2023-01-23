import 'package:first_app/services/auth/auth_service.dart';
import 'package:first_app/view/register_view.dart';
import 'package:flutter/material.dart';

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
                  AuthService.firebase().sendEmailVerification();
                },
                child: const Text('Send verification email')),
            TextButton(
                onPressed: () async {
                  await AuthService.firebase().logOut();
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
