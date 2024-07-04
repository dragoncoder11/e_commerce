import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: lightOrange,
        ),
        title: Text(
          'Sign Up',
          style: Styles.font24LightOrangeWeight400,
        ),
        centerTitle: true,
      ),
      body: const SignUpScreen(),
    );
  }
}
