import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.color, required this.body});
  final Color color;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: color,
          )),
      body: body,
    );
  }
}
