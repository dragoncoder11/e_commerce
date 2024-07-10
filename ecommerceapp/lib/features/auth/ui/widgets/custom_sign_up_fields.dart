import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../logic/cubit/register_cubit/register_cubit.dart';

class CustomSignUpFields extends StatelessWidget {
  const CustomSignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter your name';
              }
            },
            controller: BlocProvider.of<RegisterCubit>(context).nameController,
          ),
          verticalSpace(10),
          CustomTextField(
            hint: 'Phone',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid phone';
              }
            },
            controller: BlocProvider.of<RegisterCubit>(context).phoneController,
          ),
          verticalSpace(10),
          CustomTextField(
            hint: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid email';
              }
            },
            controller: BlocProvider.of<RegisterCubit>(context).emailController,
          ),
          verticalSpace(10),
          CustomTextField(
            hint: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valid password';
              }
            },
            controller:
                BlocProvider.of<RegisterCubit>(context).passwordController,
          ),
          verticalSpace(22),
        ],
      ),
    );
  }
}
