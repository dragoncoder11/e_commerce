import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key, this.onTap, this.backGroundColor, this.radius,required this.child,
  });
final Function()?onTap;
final Color? backGroundColor;
final double?radius;
final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor:backGroundColor?? Colors.white,
        radius:radius?? 16,
        child:child ,
      ),
    );
  }
}
