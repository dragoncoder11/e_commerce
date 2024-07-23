import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/features/home/logic/products_cubit/products_cubit.dart';
import 'package:ecommerceapp/features/home/ui/widgets/products_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_shimmer_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });
  //final String category;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductsCubit>(context);
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
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverGrid.builder(
                itemCount:/* cubit.allProducts.length*/6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 220),
                itemBuilder: (context, index) {
                  return const CustomShimmerItem();
                }),
          );
        } else if (state is ProductsSuccessState) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverGrid.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 220),
                itemBuilder: (context, index) {
                  return ProductCard(productModel: state.products[index]);
                }),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
