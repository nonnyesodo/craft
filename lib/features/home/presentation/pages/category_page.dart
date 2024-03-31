import 'package:craftman/constants/export.dart';
import 'package:craftman/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/export.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final watchHome = context.watch<HomeCubit>();
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(children: [
          const CustomAppbar(title: 'Categories'),
          SizedBox(height: size.height * 0.02),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.width * 0.015),
              color: Appcolors.white,
              child: HomeTextfield(
                  size: size,
                  prefixicon: Icon(Icons.search, size: 20.sp),
                  hintext: 'Search Categories')),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.width * 0.02),
                  color: Appcolors.white,
                  width: size.width,
                  child: GridView.count(
                      crossAxisSpacing: size.width * 0,
                      mainAxisSpacing: size.width * 0,
                      childAspectRatio: 1.0 / 1.3,
                      crossAxisCount: 3,
                      children: List.generate(
                          watchHome.category.length,
                          (index) =>
                              CategorieContainer(index: index, size: size)))))
        ]));
  }
}
