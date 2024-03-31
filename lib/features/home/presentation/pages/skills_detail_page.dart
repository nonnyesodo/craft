import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/home/data/local/home_image.dart';

import 'package:craftman/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/export.dart';
import '../../../splash_onboarding/data/local/onboarding_Images.dart';
import '../widget/export.dart';

class SkillsDetail extends StatelessWidget {
  const SkillsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final watchHomeCubit = context.watch<HomeCubit>();
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        loadWithloader: watchHomeCubit.state is HomeLoading,
        color: Appcolors.blue,
        body: Column(children: [
          CustomAppbar(title: watchHomeCubit.selectedCategory),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  width: size.width,
                  color: Appcolors.white,
                  child: watchHomeCubit.artisans.isNotEmpty
                      ? Column(children: [
                          SizedBox(height: size.height * 0.01),
                          HomeTextfield(
                              size: size,
                              hintext: 'search for service Providers'),
                          SizedBox(height: size.height * 0.02),
                          Column(
                              children: List.generate(
                                  watchHomeCubit.artisans.length,
                                  (index) =>
                                      ProviderDetailContainer(index: index)))
                        ])
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.05),
                            Image.asset(HomeImages.empty,
                                height: size.height * 0.5,
                                width: size.width,
                                fit: BoxFit.cover),
                            AppText(
                                text: 'No available Artisan',
                                color: Appcolors.blue,
                                fontweight: FontWeight.w500)
                          ],
                        )))
        ]));
  }
}

class ProviderDetailContainer extends StatelessWidget {
  const ProviderDetailContainer({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final artisans = context.watch<HomeCubit>().artisans;
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
        onTap: () {
          context.read<HomeCubit>().selectArtisan(artisan: artisans[index]);
          Navigator.pushNamed(context, RouteName.serviceproviderdetail);
        },
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.width * 0.02),
        width: size.width,
        margin: EdgeInsets.only(bottom: size.width * 0.02),
        child: Row(children: [
          AppshadowContainer(
              width: size.width * 0.28,
              height: size.width * 0.28,
              child: Image.asset(OnboardingImages.splash)),
          SizedBox(width: size.width * 0.03),
          SizedBox(
              width: size.width * 0.5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ServiceproviderInfo(
                        prefixIcon: Icons.person_2_outlined,
                        title: '${artisans[index].name}',
                        iconColor: Appcolors.blue),
                    SizedBox(height: size.height * 0.007),
                    ServiceproviderInfo(
                        title: '${artisans[index].address}',
                        prefixIcon: Icons.place_outlined,
                        iconColor: Appcolors.blue),
                    SizedBox(height: size.height * 0.011),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: Appcolors.orange, size: 25.sp))
                        ])
                  ]))
        ]));
  }
}
