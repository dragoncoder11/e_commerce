import 'package:ecommerceapp/features/home/logic/products_cubit/products_cubit.dart';
import 'package:ecommerceapp/features/home/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });
  //final String category;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
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
          return Expanded(
            child: Center(
              child: Lottie.asset('assets/loading.json'),
            ),
          );
        } else if (state is ProductsSuccessState) {
          return Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3.4 / 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return ProductCard(productModel: state.products[index]);
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
