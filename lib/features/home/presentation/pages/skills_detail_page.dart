import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsDetail extends StatelessWidget {
  const SkillsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios, color: Appcolors.white, size: 20.sp),
                AppText(
                    text: 'Detail',
                    color: Appcolors.white,
                    fontweight: FontWeight.w600),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 25.sp),
                        hintText: 'search for service Providers',
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03))),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        boxShadow: [
                          BoxShadow(
                              color: Appcolors.lightgrey,
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                              spreadRadius: 0)
                        ]),
                    child: Row(
                      children: [
                        ProfilePic(size: size),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ServiceproviderInfo(
                                prefixIcon: Icons.account_circle,
                                title: 'Nonny Esodo',
                                iconColor: Appcolors.lightgrey),
                            ServiceproviderInfo(
                                title: 'Egbu road',
                                prefixIcon: Icons.location_pin,
                                iconColor: Appcolors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.2,
      height: size.width * 0.2,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(OnboardingImages.splash), fit: BoxFit.contain),
          border: Border.all(width: 2.5, color: Appcolors.orange),
          borderRadius: BorderRadius.circular(size.width * 0.1)),
    );
  }
}

class ServiceproviderInfo extends StatelessWidget {
  const ServiceproviderInfo({
    super.key,
    required this.title,
    required this.prefixIcon,
    required this.iconColor,
  });
  final String title;
  final IconData prefixIcon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(prefixIcon, size: 25.sp, color: iconColor),
        AppText(
          text: title,
          size: 16,
          fontweight: FontWeight.w500,
        ),
      ],
    );
  }
}
