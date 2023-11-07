import 'package:craftman/constants/appbar.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/appshadowcontainer.dart';
import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: const CustomAppbar(title: 'Notifications'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      9,
                      (index) => AppshadowContainer(
                            shadowcolour: Appcolors.lightgrey.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.width * 0.04),
                            margin: EdgeInsets.symmetric(
                                vertical: size.width * 0.03),
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.notifications,
                                    color: Appcolors.blue, size: 25.sp),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: 'Great Deals',
                                        color: Appcolors.blue,
                                        fontweight: FontWeight.w600),
                                    SizedBox(
                                      width: size.width * 0.6,
                                      child: AppText(
                                          text:
                                              'We have an amazing deal for you ',
                                          color: Appcolors.blue,
                                          size: 14),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: AppText(
                                      text: '1h ago',
                                      size: 13,
                                      fontweight: FontWeight.w700,
                                      color: Appcolors.lightgrey),
                                )
                              ],
                            ),
                          )),
                ),
              ),
            ))
          ],
        ));
  }
}
