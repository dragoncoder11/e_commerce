import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:ecommerceapp/core/widgets/custom_circle_avatar.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../../../cart/logic/add_or_remove_cart_cubit/add_or_remove_cart_cubit.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
   // var cubit=BlocProvider.of<AddOrRemoveCartCubit>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                color: Colors.black.withOpacity(0.2),
                offset: Offset.zero,
                spreadRadius: 2)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.productModel.image!,
            height: verticalQuery(context, .112),
            width: horizentalQuery(context, .4),
            fit: BoxFit.fill,
          ),
          verticalSpace(3),
          Text(
            widget.productModel.name!,
            style: Styles.font15BrownWeight700,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${widget.productModel.price}',
                style: Styles.font15LightOrangeWeight700,
              ),
               CustomCircleAvatar(
                  radius: 17,
                  onTap: () {
                    setState(() {
                      
                    });
                 // cubit.addOrRemoveToCart(widget.productModel);
                  },
                  backGroundColor: Colors.green,
                  child: Center(
                      child: Icon(/*  cubit.products.contains(widget.productModel)?
                    Icons.check: */ Icons.add,
                    color: Colors.white,
                  )))
            ],
          ),
        ],
      ),
    );
  }
}
