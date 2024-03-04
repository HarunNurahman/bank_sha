import 'package:bank_sha/pages/home_page.dart';
import 'package:bank_sha/pages/onboarding_page.dart';
import 'package:bank_sha/pages/sign-in_page.dart';
import 'package:bank_sha/pages/sign-up-profile_page.dart';
import 'package:bank_sha/pages/sign-up-success_page.dart';
import 'package:bank_sha/pages/sign-up-verify_page.dart';
import 'package:bank_sha/pages/sign-up_page.dart';
import 'package:bank_sha/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-profile': (context) => const SignUpProfilePage(),
        '/sign-up-verify': (context) => const SignUpVerifyPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
