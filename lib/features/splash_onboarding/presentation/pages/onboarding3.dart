import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:flutter/material.dart';
import '../../../../config/page route/detail/route_name.dart';
import '../../../../constants/apptext.dart';
import '../../data/local/onboarding_images.dart';
import '../widgets/exports.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          width: size.width,
          color: Appcolors.white,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              Image.asset(OnboardingImages.search,
                  height: size.height * 0.55,
                  width: size.width * 0.9,
                  fit: BoxFit.cover),
              SizedBox(height: size.height * 0.012),
              AppText(
                  size: 20,
                  fontweight: FontWeight.w700,
                  color: Appcolors.blue,
                  maxline: 2,
                  text:
                      'Find Service Providers Close To You On The Search Bar '),
              SizedBox(height: size.height * 0.022),
              SizedBox(
                  width: size.width,
                  child: const AppText(
                      maxline: 4,
                      text:
                          'Click the searchbar to discover the service provider that is ideal and close to you for your project!')),
              SizedBox(height: size.height * 0.045),
              OnboardButton(
                  ontap: () => Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.fourthonboarding, (route) => false))
            ],
          ),
        ));
  }
}
