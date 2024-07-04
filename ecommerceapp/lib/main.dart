import 'package:ecommerceapp/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'store.dart';

void main() {
  runApp(Store(
    appRouter: AppRouter(),
  ));
}
