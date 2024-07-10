import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/features/home/data/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      /*  height: verticalQuery(context, .25),
      width: horizentalQuery(context, .48), */
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 247, 247),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productModel.image!,
            height: verticalQuery(context, .10),
            width: horizentalQuery(context, .4),
            fit: BoxFit.fill,
          ),
          Text(
            'data',
            style: Styles.font15LightOrangeWeight700,
          ),
          Text(
            'data',
            style: Styles.font12GreyWeight400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'data',
                style: Styles.font20LightBrownWeight400
                    .copyWith(color: lightOrange),
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                child: Center(
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
