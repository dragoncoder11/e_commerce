import 'package:ecommerceapp/features/auth/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid email';
              }
            },
            controller: BlocProvider.of<LoginCubit>(context).emailController,
          ),
          verticalSpace(18),
          CustomTextField(
            hint: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid password';
              }
            },
            controller: BlocProvider.of<LoginCubit>(context).passwordController,
          ),
          verticalSpace(12),
         
        ],
      ),
    );
  }
}
