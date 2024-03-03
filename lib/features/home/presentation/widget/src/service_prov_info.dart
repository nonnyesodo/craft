import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants/export.dart';

class ServiceproviderInfo extends StatelessWidget {
  const ServiceproviderInfo(
      {super.key,
      required this.title,
      required this.prefixIcon,
      required this.iconColor});
  final String title;
  final IconData prefixIcon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(prefixIcon, size: 22.sp, color: iconColor),
        AppText(text: title, size: 16, fontweight: FontWeight.w500),
      ],
    );
  }
}
