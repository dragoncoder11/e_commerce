import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  const SizedBox(height: 30,),
            Center(
                child: SvgPicture.asset(
              'assets/welcome.svg',
            )),
            verticalSpace(30),
            Text(
              'Welcome to our app',
              style: Styles.font20LightBrownWeight400,
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                ' Shop online and get groceries delivered from stores to your home in as fast as 1 hour .',
                style: Styles.font16LightBrownWeight400,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(50),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.loginScreen);
              },
              title: 'Sign up',
            ),
            verticalSpace(16),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.signUpScreen);
              },
              title: 'Sign in',
              textStyle: Styles.font17LightOrangeWeight500,
              buttonColor: whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
