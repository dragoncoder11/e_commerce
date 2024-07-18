import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/features/auth/logic/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerceapp/features/auth/logic/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerceapp/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerceapp/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerceapp/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:ecommerceapp/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerceapp/features/home/logic/products_cubit/products_cubit.dart';
import 'package:ecommerceapp/features/home/ui/screens/home.dart';
import 'package:ecommerceapp/features/home/ui/screens/home_page.dart';
import 'package:ecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: const SignUpScreen(),
                ));

      case Routes.homePage:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<BannersCubit>(
                    create: (context) => BannersCubit()..fetchBanners(),
                  ),
                  BlocProvider<CategoriesCubit>(
                    create: (context) => CategoriesCubit()..fetchCategories(),
                  ),
                  BlocProvider<ProductsCubit>(
                    create: (context) => ProductsCubit()
                      ..fetchProducts(categoryName: 'electrionic devices'),
                  ),
                ], child: const HomePage()));

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
