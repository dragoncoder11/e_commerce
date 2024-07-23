
import 'package:ecommerceapp/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:ecommerceapp/features/cart/ui/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsListView extends StatelessWidget {
  const CartsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is FailedToGetCarts) {
          showDialog(context: context, builder: (context){
            return Container(child: Text(state.errMessage),);
          });
        }
      },
      builder: (context, state) {
          if (state is GetCartsSuccess) {
          
        return  state.carts.isEmpty? const Text('no carts',style: TextStyle(color: Colors.black),):  Expanded(
          child: ListView.builder(itemCount: state.carts.length,itemBuilder: (context,index){
            return CustomCartItem(productModel: state.carts[index]);
          }),
        );
       }else{
        return const SizedBox.shrink();
       }
      },
    );/* BlocProvider(
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
