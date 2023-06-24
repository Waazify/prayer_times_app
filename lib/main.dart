import 'package:flutter/material.dart';
import 'package:prayer_times_app/screens/login_screen.dart';
import 'package:prayer_times_app/screens/signup_screen.dart';
import 'screens/times_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/times': (context) => TimesScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/tawqeet.png",
                      height: 200,
                      width: 200,
                    ),
                    const Text(
                      "Tawqeet",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const Text("The muslim prayer times App",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 27),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushReplacementNamed(context, '/login')
                          },
                          child: const Text("Login"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushReplacementNamed(context, '/signup'),
                          },
                          child: const Text("Signup"),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
