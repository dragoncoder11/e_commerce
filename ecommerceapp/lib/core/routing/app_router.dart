import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerceapp/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerceapp/features/home/ui/screens/home.dart';
import 'package:ecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/logic/cubit/auth_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return Home();
        });

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('no route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
