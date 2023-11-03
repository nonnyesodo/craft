import 'package:flutter/material.dart';
import '../../../../../constants/export.dart';
import '../../../../splash_onboarding/data/local/onboarding_Images.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.size,
    required this.height,
    required this.width,
    required this.radius,
  });

  final Size size;
  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(OnboardingImages.splash), fit: BoxFit.contain),
          border: Border.all(width: 2.5, color: Appcolors.orange),
          borderRadius: BorderRadius.circular(radius)),
    );
  }
}
