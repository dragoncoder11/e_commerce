import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/home/data/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productModel.image!,
            height: verticalQuery(context, .10),
            width: horizentalQuery(context, .4),
            fit: BoxFit.fill,
          ),
          verticalSpace(4),
          Text(
            productModel.name!,
            style: Styles.font15BrownWeight700,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productModel.price}',
                style: Styles.font15LightOrangeWeight700,
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
