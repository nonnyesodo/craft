import 'dart:developer';

import 'package:craftman/config/page%20route/page_route.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
      color: Appcolors.blue,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        width: size.width,
        color: Appcolors.lightgrey,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Container(
              width: size.width,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(OnboardingImages.review))),
            ),
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: GridView.count(
                  crossAxisSpacing: size.width * 0.05,
                  mainAxisSpacing: 0.0,
                  padding: EdgeInsets.zero,
                  childAspectRatio: 1.0 / 1.5,
                  crossAxisCount: 3,
                  children: List.generate(
                    15,
                    (index) {
                      return GestureDetector(
                        onTap: () =>
                            // log('message'),

                            Navigator.pushNamed(context, RouteName.skilldetail),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.4,
                              height: size.width * 0.25,
                              decoration: BoxDecoration(
                                  color: Appcolors.white,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.07)),
                              child: Icon(
                                Icons.handyman_rounded,
                                size: 35.sp,
                                color: Appcolors.blue,
                              ),
                            ),
                            Center(
                              child: AppText(
                                text: 'TiTle',
                                fontweight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
            // Wrap(
            //   crossAxisAlignment: WrapCrossAlignment.center,
            //   runAlignment: WrapAlignment.center,
            //   children: List.generate(
            //       15,
            //       (index) =>
            //              ),
            // )
          ],
        ),
      ),
    );
  }
}
