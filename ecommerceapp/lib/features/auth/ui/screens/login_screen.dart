import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: lightOrange,
        ),
        title: Text(
          'Sign In',
          style: Styles.font24LightOrangeWeight400,
        ),
        centerTitle: true,
      ),
      body: const LoginScreenBody(),
    );
  }
}
