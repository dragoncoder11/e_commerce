
import 'package:flutter/material.dart';

class CartsListView extends StatelessWidget {
  const CartsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column();/* BlocProvider(
      create: (context) => AddOrRemoveCartCubit(),
      child: BlocBuilder<AddOrRemoveCartCubit, AddOrRemoveCartState>(
        builder: (context, state) {
         
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              
              itemCount: BlocProvider.of<AddOrRemoveCartCubit>(context).products.length,
              itemBuilder: (context, index) {
                return CustomCartItem(productModel:BlocProvider.of<AddOrRemoveCartCubit>(context).products[index]);
              });
        },
      ),
    ); */
  }
}
