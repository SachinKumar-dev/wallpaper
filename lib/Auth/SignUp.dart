import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Auth/LogIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();

  void createUser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: pass.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('SignnedUp Successfully'),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LogIn()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/images/sign.png"),
            SizedBox(
              width: 400,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.aBeeZee(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ))),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.aBeeZee(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ))),
              ),
            ),
            ElevatedButton(
              onPressed: createUser,
              child: Text(
                "SignUp",
                style: GoogleFonts.aBeeZee(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
