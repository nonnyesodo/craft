import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.color,
      required this.body,
      this.isloading = false});
  final Color color;
  final Widget body;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child:
              AppBar(automaticallyImplyLeading: false, backgroundColor: color)),
      body: AbsorbPointer(
          absorbing: isloading,
          child: Opacity(opacity: isloading ? 0.4 : 1.0, child: body)),
    );
  }
}
