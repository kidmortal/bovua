import 'package:bovua/pages/sign_up_page.dart';
import 'package:bovua/services/analytics_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/route/route.dart' as routes;
import 'package:google_sign_in/google_sign_in.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  String? errorMessage;

  Future signIn() async {
    AnalyticsService().logEvent("SignIn", {"email": _emailController.text});
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } catch (e) {
      setState(() {
        errorMessage = "Email ou senha incorretos.";
      });
    }
  }

  Future<void> googleSignIn() async {
    try {
      final data = await _googleSignIn.signIn();
      print(data?.photoUrl);
      print(data?.email);
    } catch (error) {
      print(error);
    }
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
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                errorText: errorMessage,
                hintText: "email@email.com"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            onSubmitted: (_) => signIn(),
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Password"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text("Cadastrar"),
                onPressed: () =>
                    Navigator.pushNamed(context, SignUpPage.routeName),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                child: Text("Esqueci minha senha"),
                onPressed: () =>
                    Navigator.pushNamed(context, SignUpPage.routeName),
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
            ),
          ),
          ElevatedButton(
            onPressed: googleSignIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Google"),
                SizedBox(width: 10),
                Icon(Icons.rocket),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
