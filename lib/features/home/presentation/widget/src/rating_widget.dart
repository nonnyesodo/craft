import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/export.dart';
import '../../bloc/cubit/home_cubit.dart';
import '../export.dart';

class BasedOnReviews extends StatelessWidget {
  const BasedOnReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedArtisan = context.watch<HomeCubit>().selectedArtisan;
    return Column(
      children: [
        AppText(
            text: '${selectedArtisan.avgRatinfg}',
            size: 20,
            fontweight: FontWeight.w900,
            color: Appcolors.blue),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Icon(Icons.star,
                    size: 25.sp,
                    color:
                        index != 4 ? Appcolors.yellow : Appcolors.lightgrey))),
        AppText(
            text: 'Based on ${selectedArtisan.rating!.length} reviews',
            color: Appcolors.lightgrey,
            size: 16),
      ],
    );
  }
}

class RatingComments extends StatelessWidget {
  const RatingComments({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final selectedArtisan = context.watch<HomeCubit>().selectedArtisan;
    return Column(
        children: List.generate(
      selectedArtisan.rating?.length ?? 0,
      (index) => AppshadowContainer(
        shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.width * 0.03),
        margin: EdgeInsets.symmetric(vertical: size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              ProfilePic(
                  size: size,
                  height: size.width * 0.15,
                  width: size.width * 0.15,
                  radius: size.width * 0.1),
              SizedBox(width: size.width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: 'John Doe',
                      fontweight: FontWeight.w700,
                      color: Appcolors.blue),
                  Row(
                    children: [
                      AppText(
                          text: '${selectedArtisan.rating![index].rating}',
                          size: 14,
                          color: Appcolors.blue,
                          fontweight: FontWeight.w700),
                      Icon(Icons.star, size: 20.sp, color: Appcolors.yellow)
                    ],
                  )
                ],
              ),
              Expanded(child: Container()),
              AppText(
                  text: '1 day ago',
                  color: Appcolors.blue,
                  size: 16,
                  fontweight: FontWeight.w700)
            ]),
            SizedBox(height: size.height * 0.02),
            AppText(
                size: 14,
                color: Appcolors.lightgrey,
                fontweight: FontWeight.w500,
                text: '${selectedArtisan.rating![index].review}')
          ],
        ),
      ),
    ));
  }
}

class RatingProgressBar extends StatelessWidget {
  const RatingProgressBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
          (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                      text: '${index + 1}',
                      color: Appcolors.blue,
                      fontweight: FontWeight.w600),
                  AnimatedContainer(
                      color: Appcolors.orange,
                      width: size.width * 0.6,
                      height: size.height * 0.05,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500)),
                  AppText(
                      text: '40%',
                      color: Appcolors.blue,
                      fontweight: FontWeight.w600)
                ],
              )),
    );
  }
}
