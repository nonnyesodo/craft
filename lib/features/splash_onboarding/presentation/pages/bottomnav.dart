import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final watchOnboarding = context.watch<OnboardingCubit>();
    final readOnboarding = context.read<OnboardingCubit>();

    return Scaffold(
      body: watchOnboarding.screens
          .elementAt(watchOnboarding.bottonnavSelectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Appcolors.lightgrey,
        selectedItemColor: Appcolors.orange,
        backgroundColor: Appcolors.blue,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service, size: 35.sp),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 35.sp), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 35.sp), label: 'Profile')
        ],
        currentIndex: watchOnboarding.bottonnavSelectedIndex,
        onTap: (value) {
          readOnboarding.changebottomnavindex(index: value);
        },
      ),
    );
  }
}
