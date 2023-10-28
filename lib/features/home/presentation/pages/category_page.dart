import 'package:craftman/constants/export.dart';
import 'package:craftman/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: const CustomAppbar(title: 'Categories'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: size.width * 0.02),
                color: Appcolors.white,
                width: size.width,
                child: SizedBox(
                  height: size.height,
                  child: GridView.count(
                    crossAxisSpacing: size.width * 0.02,
                    mainAxisSpacing: size.width * 0.02,
                    childAspectRatio: 1.0 / 1.2,
                    crossAxisCount: 3,
                    children: List.generate(
                        15, (index) => CategorieContainer(size: size)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
