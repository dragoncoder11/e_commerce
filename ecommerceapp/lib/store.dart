import 'package:ecommerceapp/core/helper/constants.dart';
import 'package:ecommerceapp/core/routing/app_router.dart';
import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/features/home/ui/screens/home.dart';
import 'package:ecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Store extends StatelessWidget {
  final AppRouter appRouter;
  const Store({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home:(token==null ||token!.isEmpty)?const OnBoardingScreen():Home(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
