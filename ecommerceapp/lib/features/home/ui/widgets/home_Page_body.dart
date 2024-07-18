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
    return   Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(15),
              BannersCard(),
              verticalSpace(24),
              Row(
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
              verticalSpace(24),
              const CustomCategoriesListView(),
              verticalSpace(16),
              const ProductsGridView(),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );  
     /*    CustomScrollView(
      physics: const BouncingScrollPhysics(),
      //  scrollBehavior: MaterialScrollBehavior(),
      //shrinkWrap: true,
      slivers: [
        SliverFillRemaining(
          fillOverscroll: true,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(15),
                BannersCard(),
                verticalSpace(24),
                Row(
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
                verticalSpace(24),
                const CustomCategoriesListView(),
                verticalSpace(16),
                const ProductsGridView(
                  category: 'electrionic devices',
                ),
                verticalSpace(10),
              ],
            ),
          ),
        ),
      ],
    ); */
  }
}
      