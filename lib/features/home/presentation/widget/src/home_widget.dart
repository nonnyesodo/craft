import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftman/constants/util/useful_methods.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/home/data/home_static_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/page route/page_route.dart';
import '../../../../../constants/export.dart';
import '../../../../splash_onboarding/data/local/onboarding_images.dart';
import '../export.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text:
                      '${Utils.getGreting()}, ${context.watch<AuthCubit>().user.firstName}',
                  color: Appcolors.white,
                  fontweight: FontWeight.w700),
              AppText(
                  text: 'Lets get things done today!',
                  size: 14,
                  color: Appcolors.white),
            ],
          ),
          const NotificationIcon(),
        ],
      ),
    );
  }
}

class HomeCategoriesAndPopularService extends StatelessWidget {
  const HomeCategoriesAndPopularService({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        SizedBox(height: size.height * 0.01),
        HomeCarousel(size: size),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                text: 'Categories',
                fontweight: FontWeight.w800,
                color: Appcolors.blue),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteName.categories),
              child:
                  AppText(text: 'View All', size: 16, color: Appcolors.orange),
            ),
          ],
        ),

        // SizedBox(height: size.height * 0.01),
        SizedBox(
          height: size.height * 0.2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                6, (index) => CategorieContainer(index: index, size: size)),
          ),
        ),
        SizedBox(height: size.height * 0.025),
        AppText(
            text: 'Popular Services',
            fontweight: FontWeight.w800,
            color: Appcolors.blue),
        SizedBox(height: size.height * 0.01),
        SizedBox(
          height: size.height * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                6,
                (index) => AppshadowContainer(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.width * 0.02),
                      shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
                      margin: EdgeInsets.only(
                          right: size.width * 0.035,
                          bottom: size.width * 0.03,
                          top: size.width * 0.03),
                      width: size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: size.width,
                              height: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Appcolors.blue,
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image:
                                          AssetImage(OnboardingImages.splash)),
                                  borderRadius: BorderRadius.circular(
                                      size.width * 0.03))),
                          AppText(
                              text: 'WallPainting',
                              color: Appcolors.blue,
                              size: 16,
                              fontweight: FontWeight.w900),
                          AppText(
                              text: 'Painter', color: Appcolors.blue, size: 16)
                        ],
                      ),
                    )),
          ),
        ),
      ],
    ));
  }
}

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return HomeTextfield(
        size: size,
        prefixicon: Icon(Icons.search, size: 25.sp),
        hintext: 'Search...');
  }
}

class CategorieContainer extends StatelessWidget {
  const CategorieContainer(
      {super.key, required this.size, required this.index});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteName.skilldetail),
      child: AppshadowContainer(
        shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
        margin: EdgeInsets.only(
            right: size.width * 0.035,
            bottom: size.width * 0.03,
            top: size.width * 0.03),
        width: size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.format_paint, color: Appcolors.orange, size: 50.sp),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              height: size.height * 0.042,
              child: AppText(
                  textalign: TextAlign.center,
                  text: '${HomeStaticRepo.services[index].service}',
                  color: Appcolors.blue,
                  size: 14,
                  fontweight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 6),
          height: size.height * 0.25,
          autoPlay: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  color: Appcolors.lightgrey,
                  image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(OnboardingImages.splash))),
            );
          },
        );
      }).toList(),
    );
  }
}
