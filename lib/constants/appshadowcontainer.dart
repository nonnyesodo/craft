import 'package:flutter/cupertino.dart';
import 'export.dart';

class AppshadowContainer extends StatelessWidget {
  const AppshadowContainer(
      {super.key,
      this.child,
      this.shadowcolour,
      this.color,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.radius,
      this.onTap});
  final Widget? child;
  final Color? shadowcolour, color;
  final EdgeInsetsGeometry? padding, margin;
  final double? width, height, radius;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: color ?? Appcolors.white,
            boxShadow: [
              BoxShadow(
                  color: shadowcolour ?? Appcolors.lightgrey,
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(radius ?? size.width * 0.03)),
        child: child,
      ),
    );
  }
}
