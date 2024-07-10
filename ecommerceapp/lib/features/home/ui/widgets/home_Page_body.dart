import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/home/ui/widgets/banners_card.dart';
import 'package:ecommerceapp/features/home/ui/widgets/products_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_categories_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const ProductsGridView()
                      ],
                    ),
                  ),
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
