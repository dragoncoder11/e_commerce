
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_circle_avatar.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key, required this.productModel,
  });
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  productModel.image!,
                  height: 80.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
                horizentalSpace(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name!,
                        overflow: TextOverflow.ellipsis,
                        
                        style: Styles.font18BrownWeight700,
                      ),
                      verticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomCircleAvatar(
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: lightBrown,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: Styles.font18BrownWeight400,
                                  ),
                                  const CustomCircleAvatar(
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: lightBrown,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text('\$${productModel.price}',style: Styles.font17LightOrangeWeight500,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              color: lightBrown,
              thickness: .2,
            )
          ],
        ),
      ),
    );
  }
}
