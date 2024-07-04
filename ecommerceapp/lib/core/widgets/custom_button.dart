import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.textStyle,
      this.height,
      this.width,
      this.buttonColor,
      this.radius,
      this.borderColor,
      this.borderWidth,
      this.verticalPadding,
      this.horizentalPadding});
  final Function() onPressed;
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final double? verticalPadding;
  final double? horizentalPadding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? double.infinity,
      height: height ?? 50.h,
      color: buttonColor ?? lightOrange,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: borderColor ?? lightOrange, width: borderWidth ?? 1.5),
        borderRadius: BorderRadius.circular(radius ?? 30),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizentalPadding ?? 15.w,
          vertical: verticalPadding ?? 15.h),
      child: Center(
          child: Text(
        title,
        style: textStyle ?? Styles.font17WhiteWeight400,
      )),
    );
  }
}
