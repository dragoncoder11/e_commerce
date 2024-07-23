import 'package:animate_do/animate_do.dart';
import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/home/ui/widgets/banners_card.dart';
import 'package:ecommerceapp/features/home/ui/widgets/custom_categories_list_view.dart';
import 'package:ecommerceapp/features/home/ui/widgets/products_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: verticalSpace(15),
        ),
        BannersCard(),
        SliverToBoxAdapter(
          child: verticalSpace(10),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                   delay: const Duration(microseconds: 700),
                            duration: const Duration(seconds: 2),
                  child: Text(
                    'Categories',
                    style: Styles.font22BrownWeight700,
                  ),
                ),
                FadeInRight( delay: const Duration(microseconds: 700),
                            duration: const Duration(seconds: 2),
                  child: Text(
                    'see all',
                    style: Styles.font18LightOrangeWeight400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        const CustomCategoriesListView(),
        const ProductsGridView(),
      ],
    );
  }
}





  /*  SliverToBoxAdapter(
          child: BannersCard(),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(24),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Styles.font22BrownWeight700,
              ),
              Text(
                'see all',
                style: Styles.font18LightOrangeWeight400,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(24),
        ),
        const CustomCategoriesListView(),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        const ProductsGridView(),
        SliverToBoxAdapter(
          child: verticalSpace(10),
        ), */