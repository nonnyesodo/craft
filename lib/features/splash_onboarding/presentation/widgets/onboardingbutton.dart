import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key, required this.ontap});

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
        child: InkWell(
            onTap: ontap,
            child: Container(
                width: size.width * 0.13,
                height: size.width * 0.13,
                decoration: BoxDecoration(
                    color: Appcolors.orange,
                    borderRadius: BorderRadius.circular(size.width * 0.03)),
                child: Center(
                    child: Icon(Icons.arrow_forward_ios,
                        size: 25.sp, color: Appcolors.white)))));
  }
}
