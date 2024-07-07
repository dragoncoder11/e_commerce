import 'package:ecommerceapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: SvgPicture.asset(
                'assets/signup.svg',
                height: verticalQuery(context, .3),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Text(
                  'Please enter your information to create an account.',
                  style: Styles.font18BrownWeight400,
                ),
              ),
              verticalSpace(16),
              CustomTextField(hint: 'Name'),
              verticalSpace(10),
              CustomTextField(
                hint: 'Phone',
              ),
              verticalSpace(10),
              CustomTextField(hint: 'Email'),
              verticalSpace(10),
              CustomTextField(
                hint: 'Password',
                obscureText: true,
              ),
              verticalSpace(22),
              CustomButton(onPressed: () {}, title: 'Sign up')
            ],
          ),
        ),
      ),
    );
  }
}
