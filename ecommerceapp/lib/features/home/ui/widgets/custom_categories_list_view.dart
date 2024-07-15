import 'package:ecommerceapp/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomCategoriesListView extends StatefulWidget {
  const CustomCategoriesListView({
    super.key,
  });

  @override
  State<CustomCategoriesListView> createState() =>
      _CustomCategoriesListViewState();
}

class _CustomCategoriesListViewState extends State<CustomCategoriesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..fetchCategories(),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state is FailedToGetCategoriesState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.errMessage),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          } else if (state is CategoriesSuccessState) {
            return SizedBox(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  //  var categoryName=state.categories[selectedIndex].name!;
                  return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(microseconds: 400),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 10),
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: selectedIndex == index
                                      ? lightOrange
                                      : lightBrown)),
                          child: Center(
                              child: Text(
                            state.categories[index].name!,
                            style: selectedIndex == index
                                ? Styles.font15LightOrangeWeight700
                                : Styles.font15BrownWeight700,
                          )),
                        ),
                      ));
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
