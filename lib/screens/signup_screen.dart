import 'package:flutter/material.dart';
import 'package:prayer_times_app/resources/auth_methods.dart';
import 'package:prayer_times_app/screens/times_screen.dart';
import 'package:prayer_times_app/utils/utils.dart';
import 'package:prayer_times_app/widgets/text_field_input.dart';

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
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
      setState(() {
        _isLoading = false;
      });
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
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/tawqeet.png",
            height: 100,
            width: 100,
          ),
          const Text("Tawqeet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 27),
          const Text("Please Enter your details"),
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Username",
                textInputType: TextInputType.text),
          ),
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFieldInput(
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.text),
          ),
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
          ),
          const SizedBox(height: 27),
          ElevatedButton(
            onPressed: signUpUser,
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : const Text("Sign Up"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text("Login"))
            ],
          ),
        ],
      )),
    ));
  }
}
