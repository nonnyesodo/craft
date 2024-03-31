import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
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
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35.sp), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill, size: 35.sp),
              label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment, size: 35.sp), label: 'Booking'),
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
