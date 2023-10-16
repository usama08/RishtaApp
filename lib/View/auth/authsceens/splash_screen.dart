import 'package:easyrishta/View/auth/authsceens/signup_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    // Delay for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to the next screen (replace 'NextScreen' with your desired screen)
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/spash.png'), // Replace with your image asset
      ),
    );
  }
}
