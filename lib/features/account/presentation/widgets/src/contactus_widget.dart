import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants/export.dart';

class ContactUsSocials extends StatelessWidget {
  const ContactUsSocials({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      width: size.width,
      color: Appcolors.white,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          AppText(
              color: Appcolors.blue,
              text:
                  'Experiencing any difficulty in using our services sorry about that you can reach us through any of our phaltform below'),
          SizedBox(height: size.height * 0.03),
          const ContactUsInfo(
              prefixIcon: Icons.support_agent,
              title: 'Customer care',
              suffixicon: Icons.phone_in_talk),
          SizedBox(height: size.height * 0.02),
          const ContactUsInfo(
              prefixIcon: Icons.media_bluetooth_off,
              suffixicon: Icons.facebook,
              title: 'Facebbok'),
          SizedBox(height: size.height * 0.02),
          const ContactUsInfo(
              prefixIcon: Icons.media_bluetooth_off,
              suffixicon: Icons.wechat,
              title: 'Twitter'),
          SizedBox(height: size.height * 0.02),
          const ContactUsInfo(
              prefixIcon: Icons.media_bluetooth_off,
              suffixicon: Icons.email,
              title: 'Email'),
          SizedBox(height: size.height * 0.02),
          const ContactUsInfo(
              prefixIcon: Icons.media_bluetooth_off,
              suffixicon: Icons.facebook,
              title: 'Whatsapp'),
          SizedBox(height: size.height * 0.02),
          const ContactUsInfo(
              prefixIcon: Icons.media_bluetooth_off,
              suffixicon: Icons.phone_in_talk_sharp,
              title: 'Instagram'),
        ],
      ),
    ));
  }
}

class ContactUsAppbar extends StatelessWidget {
  const ContactUsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: const CustomAppbar(title: 'Contact Us'));
  }
}

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo(
      {super.key,
      required this.prefixIcon,
      required this.suffixicon,
      required this.title});
  final IconData prefixIcon, suffixicon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(prefixIcon, size: 25.sp, color: Appcolors.blue),
        AppText(text: title, color: Appcolors.blue),
        Icon(suffixicon, size: 25.sp, color: Appcolors.blue)
      ],
    );
  }
}
