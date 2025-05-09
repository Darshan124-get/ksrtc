import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/sign_in.dart';
import 'screens/register.dart';
import 'screens/home_map.dart'; // Import your HomeMapScreen
import 'screens/forgot_possword.dart';
void main() {
  runApp(const MyKSRTCApp());
}

class MyKSRTCApp extends StatelessWidget {
  const MyKSRTCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My KSRTC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/signin': (context) => const SignInPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeMapScreen(),
        '/forgot':(context)=> const ForgotPasswordPage()
      },
    );
  }
}
