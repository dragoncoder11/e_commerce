import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hint,
    this.hintStyle,
    this.horizontalPadding,
    this.verticalPadding,
    this.radius,
    this.borderColor,
    this.borderWidth,
    this.suffixIcon,
    this.obscureText,
    this.suffixIconColor,
    this.textFieldColor, this.cursorColor,
  });
  final String hint;
  final TextStyle? hintStyle;
  final Color? textFieldColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? suffixIcon;
  bool? obscureText;
  final Color? cursorColor;
  final Color? suffixIconColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.font16LightBrownWeight400,
      decoration: InputDecoration(
        fillColor: widget.textFieldColor ?? lightergrey,
        filled: true,
        hintText: widget.hint,
        hintStyle: widget.hintStyle ?? Styles.font16LightBrownWeight400,
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding ?? 15.w,
            vertical: widget.verticalPadding ?? 15.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 5),
          borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey, width: widget.borderWidth ?? 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 5),
          borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey, width: widget.borderWidth ?? 0),
        ),
        suffixIcon: (widget.hint.toLowerCase().contains('password'))
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
                icon: Icon(
                  widget.obscureText ?? false ? Icons.visibility_off : Icons.visibility,
                ),
                color: widget.suffixIconColor ?? lightOrange,
              )
            : widget.suffixIcon,
      ),
      cursorColor: widget.cursorColor??lightOrange,
      obscureText: widget.obscureText ?? false,
    );
  }
}