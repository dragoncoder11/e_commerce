
import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerceapp/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.onBoardingScreen:
      return MaterialPageRoute(builder: (context)=>const OnBoardingScreen());
      case Routes.loginScreen:
      return MaterialPageRoute(builder: (context)=>const LoginScreen());
      case Routes.signUpScreen:
      return MaterialPageRoute(builder: (context)=>const SignUpScreen());
        
      default:
      return MaterialPageRoute(builder: (context)=>Scaffold(
        body: Center(child: Text('no route defined for ${settings.name}'),),
      ));
    }
  }
}