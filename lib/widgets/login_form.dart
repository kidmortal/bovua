import 'package:bovua/pages/sign_up_page.dart';
import 'package:bovua/services/analytics_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/route/route.dart' as routes;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GoogleSignIn googleSignIn = GoogleSignIn();

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

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        FirebaseAuth.instance.signInWithCredential(credential);
      }
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
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: signInWithGoogle,
            style: ElevatedButton.styleFrom(primary: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 25.0,
                ),
                SizedBox(width: 10),
                Text(
                  "Sign in with google",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
