import 'package:flutter/cupertino.dart';

import 'export.dart';

class AppshadowContainer extends StatelessWidget {
  const AppshadowContainer(
      {super.key,
      this.child,
      this.shadowcolour,
      this.padding,
      this.margin,
      this.width,
      this.height});
  final Widget? child;
  final Color? shadowcolour;
  final EdgeInsetsGeometry? padding, margin;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: Appcolors.white,
          boxShadow: [
            BoxShadow(
                color: shadowcolour ?? Appcolors.lightgrey,
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(size.width * 0.03)),
      child: child,
    );
  }
}
