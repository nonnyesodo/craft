import 'package:craftman/constants/export.dart';
import 'package:craftman/features/home/presentation/widgets/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      AppText(
                          text: '4.0',
                          size: 25,
                          fontweight: FontWeight.w900,
                          color: Appcolors.blue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                size: 25.sp,
                                color: index != 4
                                    ? Appcolors.yellow
                                    : Appcolors.lightgrey)),
                      ),
                      AppText(
                          text: 'Based on 23 reviews',
                          color: Appcolors.lightgrey,
                          size: 16),
                      Column(
                        children: List.generate(
                            5,
                            (index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                        text: '${index + 1}',
                                        color: Appcolors.blue,
                                        fontweight: FontWeight.w600),
                                    AppText(
                                        text: '40%',
                                        color: Appcolors.blue,
                                        fontweight: FontWeight.w600)
                                  ],
                                )),
                      ),
                      Column(
                          children: List.generate(
                        4,
                        (index) => AppshadowContainer(
                          shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.width * 0.03),
                          margin:
                              EdgeInsets.symmetric(vertical: size.width * 0.03),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Icon(Icons.star,
                                              size: 20.sp,
                                              color: Appcolors.yellow)
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
                      )),
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
