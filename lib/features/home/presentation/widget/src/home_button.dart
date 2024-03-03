import 'package:flutter/material.dart';
import '../../../../../constants/appcolors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key,
      this.child,
      this.isloading = false,
      this.width,
      this.height,
      this.radius,
      this.ontap,
      this.buttoncolor});
  final Widget? child;
  final double? width, height, radius;
  final Function()? ontap;
  final Color? buttoncolor;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width ?? size.width,
        height: height ?? size.height * 0.055,
        decoration: BoxDecoration(
            color: buttoncolor ?? Appcolors.orange,
            borderRadius: BorderRadius.circular(radius ?? size.width * 0.03)),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Center(child: child),
      ),
    );
  }
}
