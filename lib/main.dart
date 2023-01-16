import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/view/login.dart';
import 'package:first_app/view/register_view.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage()),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                // final user = FirebaseAuth.instance.currentUser;
                // print(user);
                // final emailVerified = user?.emailVerified ?? false;
                // if (emailVerified) {
                // return const Text("Done");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const RegisterView();
                // }));
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const RegisterView()));
                // return const RegisterView();
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const VerifyEmailView()));
                //   return const VerifyEmailView();
                // } else {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const VerifyEmailView()));
                //   return const VerifyEmailView();
                // }
                // return const LoginView();
                return const LoginView();
              default:
                return const CircularProgressIndicator();
            }
          }
    );
  }
}

