import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../constants/export.dart';
import '../export.dart';

class BasedOnReviews extends StatelessWidget {
  const BasedOnReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
            text: '4.0',
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
            text: 'Based on 23 reviews', color: Appcolors.lightgrey, size: 16),
      ],
    );
  }
}

class RatingComments extends StatelessWidget {
  const RatingComments({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      4,
      (index) => AppshadowContainer(
        shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.width * 0.03),
        margin: EdgeInsets.symmetric(vertical: size.width * 0.03),
        child: Column(
          children: [
            Row(
              children: [
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
                        text: 'Faith Wyne',
                        fontweight: FontWeight.w700,
                        color: Appcolors.blue),
                    Row(
                      children: [
                        AppText(
                            text: '4.0',
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
              ],
            ),
            SizedBox(height: size.height * 0.02),
            AppText(
                size: 14,
                color: Appcolors.lightgrey,
                fontweight: FontWeight.w500,
                text:
                    'A very great guy ,did a perfect and an amazing job will recommend him to anyone who wants a perfect job')
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
                  LinearPercentIndicator(
                    // animateFromLastPercent: true,
                    // restartAnimation: true,
                    animationDuration: 500,
                    animation: true,
                    padding: EdgeInsets.zero,
                    barRadius: Radius.circular(size.width * 0.02),
                    width: size.width * 0.7,
                    lineHeight: size.height * 0.01,
                    percent: 0.8,
                    backgroundColor: Appcolors.lightgrey,
                    progressColor: Appcolors.orange,
                  ),
                  AppText(
                      text: '40%',
                      color: Appcolors.blue,
                      fontweight: FontWeight.w600)
                ],
              )),
    );
  }
}
