import 'package:flutter/material.dart';

import '../../../../constants/appcolors.dart';
import '../../../../constants/apptext.dart';
import '../../../splash_onboarding/data/local/onboarding_Images.dart';

class AllMessages extends StatelessWidget {
  const AllMessages({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.03),
      width: size.width,
      color: Appcolors.white,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              15,
              (index) => Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.width * 0.02),
                    margin: EdgeInsets.only(bottom: size.width * 0.02),
                    width: size.width,
                    // height: size.height * 0.1,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Appcolors.lightgrey, width: 2.5),
                        borderRadius: BorderRadius.circular(size.width * 0.03)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            OnboardingImages.splash,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              maxline: 2,
                              text: 'Sender full Name ',
                              fontweight: FontWeight.w700,
                              color: Appcolors.blue,
                            ),
                            const AppText(
                              text: 'Sender last message ',
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    ));
  }
}
