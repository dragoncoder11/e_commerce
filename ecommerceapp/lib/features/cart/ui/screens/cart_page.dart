import 'package:flutter/material.dart';

import '../widgets/cart_page_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartPageBody(),
    );
  }
}