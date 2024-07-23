import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/cart_page_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit()..fetchCarts(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Carts',
              style: Styles.font24LightOrangeWeight400,
            ),
            centerTitle: true,
            leading: const Icon(
              Icons.arrow_back_ios,
              color: lightOrange,
            ),
          ),
          body: const CartPageBody()),
    );
  }
}
