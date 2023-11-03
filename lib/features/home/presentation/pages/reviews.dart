import 'package:craftman/constants/export.dart';
import 'package:craftman/features/home/presentation/widget/export.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: const CustomAppbar(title: 'Reviews'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                width: size.width,
                color: Appcolors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const BasedOnReviews(),
                      SizedBox(height: size.height * 0.01),
                      RatingProgressBar(size: size),
                      SizedBox(height: size.height * 0.01),
                      RatingComments(size: size),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
