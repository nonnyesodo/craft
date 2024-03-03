import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../splash_onboarding/data/local/onboarding_Images.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int i = 0;
  List<String> images = [
    OnboardingImages.splash,
    OnboardingImages.search,
    OnboardingImages.review
  ];
  final pageController = PageController();
  changeimage() {
    emit(HomeLoading());
    i = 0;
    log(i.toString());
    if (i + 1 == images.length) {
      i = 0;
      pageController.animateToPage(i,
          curve: Curves.easeIn, duration: const Duration(microseconds: 100));
      log('eeee$i');
      // image = images[i];
    } else {
      i = pageController.page!.toInt();
      // pageController.animateToPage(i,
      //     curve: Curves.easeIn, duration: const Duration(seconds: 100));
      pageController.nextPage(
          curve: Curves.easeIn, duration: const Duration(microseconds: 200));
      // log(pageController.page!.toString());
      //
      log('eeee$i');
      // image = images[i];
    }

    emit(HomeLoaded());
    return i;
  }
}
