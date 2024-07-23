
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'carts_list_view.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // verticalSpace(40),
        CartsListView(),
      ],
    );
  }
}
