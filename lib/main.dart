import 'package:flutter/material.dart';
import 'package:prayer_times_app/screens/error_screen.dart';
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
        '/error': (context) => const ErrorScreen(),
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
            children: [
              Image.network(
                "https://www.nicepng.com/png/detail/107-1079075_islamic-crescent-with-small-star-comments-islam-crescent.png",
                height: 100,
                width: 100,
              ),
              const Text("Tawqeet",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 27),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()))
                      },
                  child: const Text("Go to Login Screen")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()))
                      },
                  child: const Text("Go to Signup Screen"))
            ],
          )),
        ),
      ),
    );
  }
}
