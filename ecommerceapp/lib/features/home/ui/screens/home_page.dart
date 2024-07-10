import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/home_Page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/n.png',
          height: 75,
          width: 130,
          fit: BoxFit.cover,
        ),
        leadingWidth: 130,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: lighterBrown,
              size: 32,
            ),
          )
        ],
      ),
      body: const HomePageBody(),
    );
  }
}
