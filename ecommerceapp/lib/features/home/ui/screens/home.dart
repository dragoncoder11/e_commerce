import 'package:ecommerceapp/core/theming/colors.dart';
import 'package:ecommerceapp/features/cart/ui/screens/cart_page.dart';
import 'package:ecommerceapp/features/favourites/ui/screens/favourites_Page.dart';
import 'package:ecommerceapp/features/home/ui/screens/home_page.dart';
import 'package:ecommerceapp/features/profile/ui/screens/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final List pages = const [
    HomePage(),
    CartPage(),
    FavouritesPage(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(elevation: 0,
        selectedItemColor: lightOrange,
        unselectedItemColor: brown,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        onTap: (value) {
          
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
