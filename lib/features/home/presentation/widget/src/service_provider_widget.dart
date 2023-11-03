import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/page route/page_route.dart';
import '../../../../../constants/export.dart';
import '../../../../splash_onboarding/data/local/onboarding_images.dart';
import '../export.dart';

class ImagesAndVideo extends StatelessWidget {
  const ImagesAndVideo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  text: 'Images and video',
                  color: Appcolors.blue,
                  fontweight: FontWeight.w700),
              AppText(
                  text: 'See all',
                  color: Appcolors.orange,
                  size: 14,
                  fontweight: FontWeight.w700)
            ],
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            height: size.height * 0.2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  4,
                  (index) => AppshadowContainer(
                        shadowcolour: Appcolors.lightgrey.withOpacity(0.25),
                        margin: EdgeInsets.only(
                            right: size.width * 0.04,
                            bottom: size.width * 0.02,
                            top: size.width * 0.02),
                        width: size.width * 0.35,
                        child: Image.asset(OnboardingImages.splash),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                text: 'Personal Info',
                color: Appcolors.blue,
                fontweight: FontWeight.w800),
            SizedBox(height: size.height * 0.01),
            const ProviderInfo(
                value: 'Okigwe Rd', prefixicon: Icons.location_pin),
            SizedBox(height: size.height * 0.005),
            const ProviderInfo(
                value: '07030066075', prefixicon: Icons.phone_android),
          ],
        ));
  }
}

class CostAndDistanceValues extends StatelessWidget {
  const CostAndDistanceValues({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          const CostAndDistance(title: 'Cost', subtitle: '₦60/Room'),
          SizedBox(height: size.height * 0.003),
          const CostAndDistance(title: 'Distance from you', subtitle: '25km'),
        ],
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              text: 'About me',
              color: Appcolors.blue,
              fontweight: FontWeight.w700),
          AppText(
              maxline: 4,
              size: 13.5,
              color: Appcolors.blue.withOpacity(0.7),
              text:
                  'Painter with a passion for capturing the beauty of the world around me.My paintings are known for their vibrant colors and expressive brushstrokes'),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}

class JobAndTaskInfo extends StatelessWidget {
  const JobAndTaskInfo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteName.reviews),
              child: const WorkInfo(
                  title: 'Ratings', subtitle: '4.5', icon: Icons.star)),
          SizedBox(width: size.width * 0.2),
          WorkInfo(
              iconcolor: Appcolors.blue,
              title: 'Taskdone',
              subtitle: '50',
              icon: Icons.work_history)
        ],
      ),
    );
  }
}

class ProfilePIc extends StatelessWidget {
  const ProfilePIc({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePic(
              size: size,
              height: size.width * 0.25,
              radius: size.width * 0.2,
              width: size.width * 0.25),
          SizedBox(width: size.width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text: 'Nonny Esodo',
                  fontweight: FontWeight.w600,
                  color: Appcolors.blue),
              Row(
                children: [
                  AppText(
                      text: 'Painter',
                      color: Appcolors.blackColor.withOpacity(0.5),
                      size: 16),
                  SizedBox(width: size.width * 0.02),
                  HomeButton(
                      buttoncolor: Appcolors.green,
                      width: size.width * 0.2,
                      height: size.height * 0.045,
                      radius: size.width * 0.02,
                      ontap: () {},
                      child: AppText(
                          text: 'Verified',
                          size: 12,
                          fontweight: FontWeight.w600,
                          color: Appcolors.white))
                ],
              ),
              AppText(
                  text: 'Member since 2022',
                  color: Appcolors.blackColor.withOpacity(0.5),
                  size: 16),
            ],
          )
        ],
      ),
    );
  }
}

class BookNow extends StatelessWidget {
  const BookNow({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.width * 0.03),
      width: size.width,
      decoration: BoxDecoration(
        color: Appcolors.white,
        border: Border.all(
            color: Appcolors.lightgrey.withOpacity(0.1), width: 2.5.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeButton(
              width: size.width * 0.5,
              height: size.height * 0.06,
              radius: size.width * 0.02,
              child: AppText(
                  text: 'Book Now',
                  color: Appcolors.white,
                  size: 16,
                  fontweight: FontWeight.w600),
              ontap: () => Navigator.pushNamed(context, RouteName.categories)),
          // SizedBox(width: size.width * 0.1),
          CircleAvatar(
            radius: 25.sp,
            backgroundColor: Appcolors.lightgrey.withOpacity(0.2),
            child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteName.chat),
                child: Icon(Icons.message_outlined,
                    size: 25.sp, color: Appcolors.orange)),
          ),
          GestureDetector(
            onTap: () async {
              final call = Uri.parse('tel:+91 9830268966');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
            child: CircleAvatar(
                backgroundColor: Appcolors.lightgrey.withOpacity(0.2),
                radius: 25.sp,
                child: Icon(Icons.phone, size: 25.sp, color: Appcolors.green)),
          )
        ],
      ),
    );
  }
}

class CostAndDistance extends StatelessWidget {
  const CostAndDistance(
      {super.key, required this.title, required this.subtitle});
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
            text: title, fontweight: FontWeight.w800, color: Appcolors.blue),
        AppText(
            text: subtitle,
            fontweight: FontWeight.w600,
            size: 16,
            color: Appcolors.orange)
      ],
    );
  }
}

class WorkInfo extends StatelessWidget {
  const WorkInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconcolor,
  });
  final String title, subtitle;
  final IconData icon;
  final Color? iconcolor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconcolor ?? Appcolors.yellow, size: 22.sp),
            AppText(
                text: subtitle,
                size: 14,
                fontweight: FontWeight.w700,
                color: Appcolors.blue)
          ],
        ),
        AppText(
          text: title,
          fontweight: FontWeight.w600,
          color: Appcolors.blue,
        )
      ],
    );
  }
}

class ProviderInfo extends StatelessWidget {
  const ProviderInfo(
      {super.key, required this.value, required this.prefixicon});
  final String value;
  final IconData prefixicon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(prefixicon, color: Appcolors.blue, size: 20.sp),
        SizedBox(width: size.width * 0.02),
        AppText(
          text: value,
          size: 16,
          fontweight: FontWeight.w600,
          color: Appcolors.blue,
        ),
      ],
    );
  }
}
