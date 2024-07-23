import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class CustomShimmerItem extends StatelessWidget {
  const CustomShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: grey,
        highlightColor: Colors.white,
        enabled: true,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset.zero,
                    spreadRadius: 2)
              ]),
        ));
  }
}
