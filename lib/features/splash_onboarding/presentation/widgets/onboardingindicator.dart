import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/appcolors.dart';
import '../bloc/cubit/onboarding_cubit.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.01, top: size.width * 0.03),
                width: size.width * 0.07,
                height: size.height * 0.01,
                decoration: BoxDecoration(
                    color:
                        context.watch<OnboardingCubit>().onboardindicatindex ==
                                index
                            ? Appcolors.orange
                            : Appcolors.blue,
                    borderRadius: BorderRadius.circular(size.width * 0.03)),
              )),
    );
  }
}
