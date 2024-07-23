import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannersCard extends StatelessWidget {
  BannersCard({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<BannersCubit, BannersState>(
        listener: (context, state) {
          if (state is FailedToGetBannersState) {
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
          if (state is BannersLoadingState) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          } else if (state is BannersSuccessState) {
            return SizedBox(
                height: verticalQuery(context, .22),
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: state.banners.length,
                  itemBuilder: (context, index, _) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: state.banners[index].image,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            Lottie.asset('assets/loading.json'),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      scrollPhysics: const BouncingScrollPhysics()),
                ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}







/*  PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CachedNetworkImage(
                    imageUrl: state.banners[index].image,fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Lottie.asset('assets/loading.json'),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            ), */