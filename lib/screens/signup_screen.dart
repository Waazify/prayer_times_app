import 'package:flutter/material.dart';
import 'package:prayer_times_app/resources/auth_methods.dart';
import 'package:prayer_times_app/screens/error_screen.dart';
import 'package:prayer_times_app/screens/login_screen.dart';
import 'package:prayer_times_app/screens/times_screen.dart';
import 'package:prayer_times_app/utils/utils.dart';
import 'package:prayer_times_app/widgets/text_field_input.dart';
import '../resources/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TimesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: [
          const Text("Please Enter your details"),
          const SizedBox(height: 27),
          TextFieldInput(
              textEditingController: _usernameController,
              hintText: "Username",
              textInputType: TextInputType.text),
          const SizedBox(height: 27),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Email",
              textInputType: TextInputType.text),
          const SizedBox(height: 27),
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: "Password",
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(height: 27),
          ElevatedButton(
            onPressed: signUpUser,
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : const Text("Sign Up"),
          )
        ],
      )),
    ));
  }
}
