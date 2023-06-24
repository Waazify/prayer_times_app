import 'package:flutter/material.dart';
import 'package:prayer_times_app/screens/times_screen.dart';
import 'package:prayer_times_app/widgets/text_field_input.dart';
import "../utils/utils.dart";
import '../resources/auth_methods.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TimesScreen(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }

    print(res);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Image.network(
                  "https://www.nicepng.com/png/detail/107-1079075_islamic-crescent-with-small-star-comments-islam-crescent.png",
                  height: 100,
                  width: 100,
                ),
                const Text("Tawqeet",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFieldInput(
                      textEditingController: _emailController,
                      hintText: "Email",
                      textInputType: TextInputType.text),
                ),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.text,
                      isPass: true,
                    )),
                ElevatedButton(
                    onPressed: () => {loginUser()}, child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
