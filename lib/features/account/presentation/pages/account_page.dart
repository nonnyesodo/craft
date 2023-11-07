import 'dart:developer';

import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/constants/export.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_button.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: AppText(
                    text: 'Welcome Back!',
                    color: Appcolors.white,
                    fontweight: FontWeight.w700)),
            SizedBox(height: size.height * 0.04),
            const AcountpageUserInfo(),
            SizedBox(height: size.height * 0.1),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -30,
                    left: 0,
                    right: 0,
                    child: AppshadowContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: size.width * 0.03),
                      width: size.width,
                      // decoration: BoxDecoration(
                      //     color: Appcolors.lightgrey,
                      //     borderRadius:
                      //         BorderRadius.circular(size.width * 0.03)),
                      child: Column(
                        children: [
                          AccountSelection(
                              size: size,
                              title: 'Account Details',
                              prefixIcon: Icons.account_circle,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.accountdetail);
                              }),
                          AccountSelection(
                              size: size,
                              prefixIcon: Icons.key,
                              title: 'Change Password',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.changepassword);
                              }),
                          AccountSelection(
                              size: size,
                              prefixIcon: Icons.contact_support,
                              title: 'Contact Us',
                              onTap: () => Navigator.pushNamed(
                                  context, RouteName.contactUs)),
                          AccountSelection(
                              hidedivider: true,
                              size: size,
                              prefixIcon: Icons.help,
                              title: 'Help'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: size.height * 0.14,
                      right: 0,
                      left: 0,
                      child: AccountButton(
                          buttoncolor: Appcolors.redColor,
                          width: size.width,
                          height: size.width * 0.13,
                          radius: size.width * 0.03,
                          ontap: () {},
                          child: AppText(
                              text: 'Delete Account',
                              fontweight: FontWeight.w600,
                              color: Appcolors.white))),
                  Positioned(
                      bottom: size.height * 0.055,
                      right: 0,
                      left: 0,
                      child: AccountButton(
                        width: size.width,
                        height: size.height * 0.06,
                        radius: size.width * 0.03,
                        ontap: () {},
                        child: AppText(
                            text: 'Deactivate Account',
                            fontweight: FontWeight.w600,
                            color: Appcolors.white),
                      )),
                ],
              ),
            ))
          ],
        ));
  }
}

class AcountpageUserInfo extends StatelessWidget {
  const AcountpageUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.25,
            height: size.width * 0.25,
            decoration: BoxDecoration(
                color: Appcolors.orange,
                image: const DecorationImage(
                    image: AssetImage(OnboardingImages.splash)),
                borderRadius: BorderRadius.circular(size.width * 0.15)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: AppText(
                  text: 'Nonny esodo',
                  size: 14,
                  color: Appcolors.white,
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                child: AppText(
                  text: 'Nonnyesodo@gmail.com',
                  color: Appcolors.white,
                  size: 14,
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.logout_outlined,
                size: 30.sp,
                color: Appcolors.orange,
              ),
              AppText(
                text: 'Sign Out',
                color: Appcolors.white,
                size: 12,
              )
            ],
          )
        ],
      ),
    );
  }
}

class AccountSelection extends StatelessWidget {
  const AccountSelection(
      {super.key,
      required this.size,
      required this.prefixIcon,
      required this.title,
      this.hidedivider = false,
      this.onTap});

  final Size size;
  final IconData prefixIcon;
  final String title;
  final bool hidedivider;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.width * 0.03),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(prefixIcon, size: 28.sp),
                AppText(text: title, fontweight: FontWeight.w500, size: 16),
                Icon(Icons.arrow_forward_ios, size: 28.sp)
              ],
            ),
          ),
        ),
        Visibility(
            visible: !hidedivider,
            child: Divider(color: Appcolors.blackColor.withOpacity(0.5)))
      ],
    );
  }
}
