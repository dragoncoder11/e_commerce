import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/auth/ui/widgets/email_and_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is FailedToLoginState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(state.errMessage),
              );
            },
          );
        }
        if (state is LoginSuccessState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(
                  'Success',
                  style: Styles.font16LightBrownWeight400
                      .copyWith(color: Colors.green),
                ),
              );
            },
          );
          Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return Center(
            child: Lottie.asset('assets/loading.json'),
          );
        }
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
                      child: SvgPicture.asset('assets/login.svg',
                          height: verticalQuery(context, .3))),
                  Padding(
                    padding: const EdgeInsets.only(right: 26),
                    child: Text(
                      'Enter your Email and password to access your account',
                      style: Styles.font18BrownWeight400,
                    ),
                  ),
                  verticalSpace(16),
                  const EmailAndPassword(),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgote Password',
                        style: Styles.font14LightOrangeWeight400,
                      )),
                  verticalSpace(20),
                  CustomButton(
                    onPressed: () {
                      if (BlocProvider.of<LoginCubit>(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        BlocProvider.of<LoginCubit>(context).login();
                      }
                    },
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
      },
    );
  }
}
