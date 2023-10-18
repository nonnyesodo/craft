import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton(
      {super.key,
      this.child,
      required this.width,
      required this.height,
      required this.radius,
      required this.ontap,
      this.buttoncolor});
  final Widget? child;
  final double width, height, radius;
  final VoidCallback ontap;
  final Color? buttoncolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttoncolor ?? Appcolors.orange,
            borderRadius: BorderRadius.circular(radius)),
        child: Center(child: child),
      ),
    );
  }
}
