import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';

import '../widget/export.dart';

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
              child: const CustomAppbar(title: 'Profile'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              width: size.width,
              color: Appcolors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.025),
                    ProfilePIc(size: size),
                    SizedBox(height: size.height * 0.01),
                    JobAndTaskInfo(size: size),
                    SizedBox(height: size.height * 0.02),
                    AboutMe(size: size),
                    CostAndDistanceValues(size: size),
                    SizedBox(height: size.height * 0.025),
                    PersonalInformation(size: size),
                    SizedBox(height: size.height * 0.02),
                    ImagesAndVideo(size: size),
                  ],
                ),
              ),
            )),
            BookNow(size: size)
          ],
        ));
  }
}
