import 'package:flutter/material.dart';
import '../../../../../constants/appcolors.dart';

class BookingButton extends StatelessWidget {
  const BookingButton(
      {super.key,
      this.child,
      this.isloading = false,
      required this.width,
      required this.height,
      required this.radius,
      this.ontap,
      this.buttoncolor,
      this.boderColor});
  final Widget? child;
  final double width, height, radius;
  final Function()? ontap;
  final Color? buttoncolor, boderColor;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: boderColor ?? Appcolors.orange),
            color: buttoncolor ?? Appcolors.orange,
            borderRadius: BorderRadius.circular(radius)),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Center(child: child),
      ),
    );
  }
}
