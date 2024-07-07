import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/core/widgets/custom_button.dart';
import 'package:ecommerceapp/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SvgPicture.asset(
                'assets/login.svg',
                height:verticalQuery(context, .35)
              )),
              Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Text(
                  'Enter your Email and password to access your account',
                  style: Styles.font18BrownWeight400,
                ),
              ),
              verticalSpace(16),
              CustomTextField(hint: 'Email'),
              verticalSpace(18),
              CustomTextField(
                hint: 'Password',
                obscureText: true,
              ),
              verticalSpace(12),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgote Password',
                    style: Styles.font14LightOrangeWeight400,
                  )),
              verticalSpace(20),
              CustomButton(
                onPressed: () {},
                title: 'Sign in',
              ),
              verticalSpace(18),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have an account? ',
                    style: Styles.font16LightBrownWeight400,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign Up',
                          style: Styles.font17LightOrangeWeight500),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
