import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:flutter/material.dart';
import '../../../../constants/export.dart';
import '../widget/export.dart';

class SkillsDetail extends StatelessWidget {
  const SkillsDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                    size: size,
                    hintext: 'search for service Providers',
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.serviceproviderdetail);
                    },
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
                          ProfilePic(
                              size: size,
                              height: size.width * 0.2,
                              width: size.width * 0.2,
                              radius: size.width * 0.1),
                          SizedBox(width: size.width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ServiceproviderInfo(
                                  prefixIcon: Icons.account_circle,
                                  title: 'Nonny Esodo',
                                  iconColor: Appcolors.lightgrey),
                              SizedBox(height: size.height * 0.007),
                              ServiceproviderInfo(
                                  title: 'Egbu road',
                                  prefixIcon: Icons.location_pin,
                                  iconColor: Appcolors.blue)
                            ],
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
