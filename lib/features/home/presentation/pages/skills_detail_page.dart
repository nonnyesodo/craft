import 'dart:developer';

import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/export.dart';
import '../widget/export.dart';

class SkillsDetail extends StatefulWidget {
  const SkillsDetail({super.key});

  @override
  State<SkillsDetail> createState() => _SkillsDetailState();
}

class _SkillsDetailState extends State<SkillsDetail> {
  @override
  Widget build(BuildContext context) {
    final watchHomeCubit = context.watch<HomeCubit>();
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: const CustomAppbar(title: 'Detail')),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  HomeTextfield(
                      size: size, hintext: 'search for service Providers'),
                  SizedBox(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, RouteName.serviceproviderdetail),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.width * 0.02),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Appcolors.white,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.03),
                          boxShadow: [
                            BoxShadow(
                                color: Appcolors.lightgrey,
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                                spreadRadius: 0)
                          ]),
                      child: Row(
                        children: [
                          AppshadowContainer(
                            width: size.width * 0.28,
                            height: size.width * 0.28,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              PageView(
                                controller: watchHomeCubit.pageController,
                                // onPageChanged: (value) => ,
                                children: List.generate(
                                    watchHomeCubit.images.length,
                                    (index) => Image.asset(
                                        watchHomeCubit.images[context
                                            .read<HomeCubit>()
                                            .changeimage()])),
                              ),
                              Positioned(
                                  bottom: size.width * 0.02,
                                  child: Row(
                                      children: List.generate(
                                          3,
                                          (index) => AppshadowContainer(
                                              margin: EdgeInsets.only(
                                                  right: size.width * 0.01),
                                              width: size.width * 0.022,
                                              height: size.width * 0.022,
                                              color: Appcolors.orange))))
                            ]),
                          ),
                          SizedBox(width: size.width * 0.03),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ServiceproviderInfo(
                                    prefixIcon: Icons.person_2_outlined,
                                    title: 'Nonny Esodo',
                                    iconColor: Appcolors.blue),
                                SizedBox(height: size.height * 0.007),
                                ServiceproviderInfo(
                                    title: 'Egbu road',
                                    prefixIcon: Icons.place_outlined,
                                    iconColor: Appcolors.blue),
                                SizedBox(height: size.height * 0.011),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeButton(
                                        width: size.width * 0.3,
                                        height: size.height * 0.05,
                                        buttoncolor: Appcolors.blue,
                                        child: AppText(
                                            text: 'Book Now',
                                            color: Appcolors.white,
                                            size: 14,
                                            fontweight: FontWeight.w600)),
                                    AppshadowContainer(
                                        color: Appcolors.blue.withOpacity(0.3),
                                        shadowcolour: Colors.transparent,
                                        width: size.width * 0.09,
                                        height: size.width * 0.09,
                                        child: Icon(CupertinoIcons.phone,
                                            color: Appcolors.orange,
                                            size: 25.sp))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
