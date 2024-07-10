import 'package:ecommerceapp/features/home/logic/products_cubit/products_cubit.dart';
import 'package:ecommerceapp/features/home/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit()..fetchProducts(categoryName: 'electronic devices'),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
           if (state is FailedToGetProductsState) {
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
        },
        builder: (context, state) {
           if (state is ProductsLoadingState) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          }
          else if(state is ProductsSuccessState){
 return SizedBox(
            height: 1500,
            child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.1 / 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return  ProductCard(productModel: state.products[index].product!,);
                }),
          );
          }else {
            return const SizedBox.shrink();
          }
         
        },
      ),
    );
  }
}
