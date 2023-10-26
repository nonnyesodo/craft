import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/export.dart';
import 'package:craftman/features/home/presentation/pages/skills_detail_page.dart';
import 'package:craftman/features/home/presentation/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProviderDetail extends StatelessWidget {
  const ServiceProviderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomAppbar(title: 'title'),
                  Row(
                    children: [
                      Icon(Icons.phone,
                          size: 25.sp, color: Appcolors.lightgrey),
                      SizedBox(width: size.width * 0.1),
                      InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.chat),
                          child: Icon(Icons.chat,
                              size: 25.sp, color: Appcolors.lightgrey))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Center(
                      child: ProfilePic(
                          size: size,
                          height: size.width * 0.35,
                          radius: size.width * 0.2,
                          width: size.width * 0.35)),
                  SizedBox(height: size.height * 0.02),
                  const ProviderInfo(
                      value: 'Nonny Esodo',
                      title: 'Name',
                      prefixicon: Icons.account_circle),
                  SizedBox(height: size.height * 0.02),
                  const ProviderInfo(
                      title: 'Location',
                      value: 'Okigwe Rd',
                      prefixicon: Icons.location_pin),
                  SizedBox(height: size.height * 0.02),
                  const ProviderInfo(
                      title: 'Mobile',
                      value: '07030066075',
                      prefixicon: Icons.phone),
                  SizedBox(height: size.height * 0.02),
                  const ProviderInfo(
                      title: 'Skill', value: 'AC', prefixicon: Icons.work),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ))
          ],
        ));
  }
}

class ProviderInfo extends StatelessWidget {
  const ProviderInfo({
    super.key,
    required this.title,
    required this.value,
    required this.prefixicon,
  });
  final String title, value;
  final IconData prefixicon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            text: title, color: Appcolors.blue, fontweight: FontWeight.w600),
        Row(
          children: [
            Icon(prefixicon, color: Appcolors.blue, size: 25.sp),
            AppText(text: value),
          ],
        ),
      ],
    );
  }
}
