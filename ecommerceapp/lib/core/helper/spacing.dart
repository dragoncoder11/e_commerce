import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(
      height: height.h,
    );
SizedBox horizentalSpace(double width) => SizedBox(
      width: width.w,
    );
verticalQuery(BuildContext context,double verticalQ){
  return MediaQuery.of(context).size.height*verticalQ.h;
}
horizentalQuery(BuildContext context,double horizentalQ){
  return MediaQuery.of(context).size.height*horizentalQ.w;
}