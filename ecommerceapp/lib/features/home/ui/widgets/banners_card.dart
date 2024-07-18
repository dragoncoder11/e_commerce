import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/helper/spacing.dart';
import 'package:ecommerceapp/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BannersCard extends StatelessWidget {
  BannersCard({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit, BannersState>(
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
            height: verticalQuery(context, .2),
            width: double.infinity,
            child: PageView.builder(
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
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
