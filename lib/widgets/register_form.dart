import 'package:bovua/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/route/route.dart' as routes;

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? emailError;
  String? passwordError;

  Future _submit() async {
    emailError = null;
    passwordError = null;
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        passwordError = 'As Senhas devem ser iguais';
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pushNamed(context, HomePage.routeName);
    } catch (e) {
      setState(() {
        emailError = "Email ja cadastrado.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                errorText: emailError,
                hintText: "email@email.com"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Repeat Password",
                errorText: passwordError),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text("Esqueci minha senha"),
                onPressed: () =>
                    Navigator.pushNamed(context, HomePage.routeName),
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
              onPressed: _submit,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Sign up"),
                  SizedBox(width: 10),
                  Icon(Icons.rocket),
                ],
              ))
        ],
      ),
    );
  }
}
