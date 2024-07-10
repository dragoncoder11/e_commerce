import 'package:ecommerceapp/core/routing/routes.dart';
import 'package:ecommerceapp/core/widgets/custom_button.dart';
import 'package:ecommerceapp/features/auth/logic/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerceapp/features/auth/ui/widgets/custom_sign_up_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is FailedToRegisterState) {
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
      if (state is RegisterSuccessState) {
        showDialog(
          context: context,
          builder: (context) {
            return ScaffoldMessenger(
                child: Text(
              'success',
              style: Styles.font16LightBrownWeight400
                  .copyWith(color: Colors.green),
            ));
          },
        );
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
      }
    }, builder: (context, state) {
      if (state is RegisterLoadingState) {
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
              children: [
                Center(
                    child: SvgPicture.asset(
                  'assets/signup.svg',
                  height: verticalQuery(context, .27),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Text(
                    'Please enter your information to create an account.',
                    style: Styles.font18BrownWeight400,
                  ),
                ),
                verticalSpace(16),
                const CustomSignUpFields(),
                CustomButton(
                    onPressed: () {
                      if (BlocProvider.of<RegisterCubit>(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        BlocProvider.of<RegisterCubit>(context).signUp();
                      }
                    },
                    title: 'Sign up')
              ],
            ),
          ),
        ),
      );
    });
  }
}
