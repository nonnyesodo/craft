import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';
import '../widgets/exports.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            const ContactUsAppbar(),
            SizedBox(height: size.height * 0.02),
            const ContactUsSocials()
          ],
        ));
  }
}
