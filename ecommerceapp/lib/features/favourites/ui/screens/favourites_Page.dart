import 'package:flutter/material.dart';

import '../widgets/favourites_page_body.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavouritesPageBody(),
    );
  }
}