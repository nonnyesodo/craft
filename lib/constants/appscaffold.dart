import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.color,
      required this.body,
      this.isloading = false,
      this.loadWithloader = false});
  final Color color;
  final Widget body;
  final bool isloading, loadWithloader;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.h),
            child: AppBar(
                automaticallyImplyLeading: false, backgroundColor: color)),
        body: AbsorbPointer(
            absorbing: isloading || loadWithloader,
            child: Opacity(
                opacity: isloading || loadWithloader ? 0.4 : 1.0,
                child: loadWithloader
                    ? Stack(alignment: Alignment.center, children: [
                        body,
                        LoadingAnimationWidget.inkDrop(
                            color: Appcolors.blue, size: 25.sp)
                      ])
                    : body)));
  }
}
