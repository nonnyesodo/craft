import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:flutter/material.dart';
import '../widget/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeAppbar(size: size),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  width: size.width,
                  color: Appcolors.white,
                  child: Column(children: [
                    SizedBox(height: size.height * 0.01),
                    HomeCategoriesAndPopularService(size: size)
                  ])))
        ]));
  }
}
