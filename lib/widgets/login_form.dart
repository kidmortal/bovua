import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/route/route.dart' as routes;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 100,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bovua_line_blue.png"),
                  ),
                ),
              ),
            ),
          ),
           TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "email@email.com"),
          ),
          const SizedBox(height: 20),
           TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Password"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text("Sign Up"),
                onPressed: () =>
                    Navigator.pushNamed(context, routes.signUpPage),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: signIn,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Sign in"),
                  SizedBox(width: 10),
                  Icon(Icons.rocket),
                ],
              ))
        ],
      ),
    );
  }
}


