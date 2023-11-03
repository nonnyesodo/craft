import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';

class HomeTextfield extends StatelessWidget {
  const HomeTextfield({
    super.key,
    required this.size,
    this.prefixicon,
    this.hintext,
    this.controller,
  });

  final Size size;
  final Widget? prefixicon;
  final String? hintext;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: prefixicon,
            hintText: hintext,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Appcolors.lightgrey.withOpacity(0.4), width: 2.5),
                borderRadius: BorderRadius.circular(size.width * 0.03)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.5, color: Appcolors.blue),
                borderRadius: BorderRadius.circular(size.width * 0.03))));
  }
}
