import 'package:ecommerceapp/core/routing/app_router.dart';
import 'package:ecommerceapp/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Store extends StatelessWidget {
  final AppRouter appRouter;
  const Store({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:const OnBoardingScreen(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}