import 'package:craftman/constants/appshadowcontainer.dart';
import 'package:craftman/features/home/presentation/widgets/export.dart';
import 'package:craftman/features/home/presentation/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width,
      color: Appcolors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            HomeTextfield(
                size: size,
                hintext: 'Search Chat',
                prefixicon: Icon(Icons.search, size: 20.sp)),
            SizedBox(height: size.height * 0.02),
            AppText(
                text: 'Chats',
                size: 20,
                fontweight: FontWeight.w800,
                color: Appcolors.blue),
            SizedBox(height: size.height * 0.01),
            Column(
              children: List.generate(
                  15,
                  (index) => AppshadowContainer(
                        shadowcolour: Appcolors.lightgrey.withOpacity(0.2),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.width * 0.02),
                        margin: EdgeInsets.only(
                          bottom: size.width * 0.03,
                        ),
                        width: size.width,
                        // height: size.height * 0.1,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfilePic(
                                size: size,
                                height: size.width * 0.15,
                                width: size.width * 0.15,
                                radius: size.width * 0.1),
                            SizedBox(width: size.width * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.65,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        maxline: 2,
                                        text: 'John Doe ',
                                        fontweight: FontWeight.w700,
                                        color: Appcolors.blue,
                                      ),
                                      AppText(
                                          text: '2 min ago',
                                          size: 12,
                                          fontweight: FontWeight.w700,
                                          color: Appcolors.blue)
                                    ],
                                  ),
                                ),
                                AppText(
                                    text: 'Are You done?',
                                    color: Appcolors.lightgrey,
                                    size: 14),
                              ],
                            ),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
