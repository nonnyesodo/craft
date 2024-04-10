import 'dart:developer';
import 'package:craftman/constants/export.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_button.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProviderForm extends StatelessWidget {
  const ServiceProviderForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(children: [
          const CustomAppbar(title: 'Welcome Nonny Schwab'),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  width: size.width,
                  color: Appcolors.white,
                  child: Expanded(
                      child: Column(children: [
                    SizedBox(height: size.height * 0.01),
                    AppshadowContainer(
                        shadowcolour: Appcolors.white,
                        width: size.width,
                        height: size.height * 0.02,
                        color: Appcolors.orange),
                    Expanded(
                        child: PageView(children: [
                      FirstPage(size: size),
                      SecondPage(size: size),
                      ThirdPage(size: size),
                      FourthPage(size: size)
                    ]))
                  ]))))
        ]));
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            color: Appcolors.blue,
            text: 'Fill Your Personal Information',
            size: 30,
            fontweight: FontWeight.w700),
        const AppText(
            fontweight: FontWeight.w500,
            size: 16,
            text: "fill your information to help indentify you "),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'First Name', prefixicon: Icon(Icons.work, size: 20.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Last Name', prefixicon: Icon(Icons.work, size: 20.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Email ', prefixicon: Icon(Icons.work, size: 20.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Ofiice Address',
            prefixicon: Icon(Icons.location_pin, size: 20.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Phone',
            prefixicon: Icon(Icons.phone_android, size: 20.sp)),
        SizedBox(height: size.height * 0.08),
        AccountButton(
            width: size.width,
            height: size.height * 0.06,
            radius: size.width * 0.03,
            // ontap: () {},
            child: AppText(
                text: 'Procced',
                size: 14,
                color: Appcolors.white,
                fontweight: FontWeight.w600))
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            color: Appcolors.blue,
            text: 'Fill Your Craft\nInformation',
            size: 30,
            fontweight: FontWeight.w700),
        const AppText(
            fontweight: FontWeight.w500,
            size: 16,
            text: "fill your Craft to help Users find  you "),
        SizedBox(height: size.height * 0.02),
        DropDown(size: size),
        SizedBox(height: size.height * 0.02),
        AppText(text: 'How much do you charge for maintence', size: 14),
        AcctTextfield(hintext: 'Price/per maitenace'),
        SizedBox(height: size.height * 0.02),
        AppText(text: 'How much do you charge for new', size: 14),
        AcctTextfield(hintext: 'Price/per new'),
        SizedBox(height: size.height * 0.02),
        AppText(
            text: 'Upload Photos of your craft(minimum of 5 photos)', size: 14),
        SizedBox(height: size.height * 0.01),
        AppshadowContainer(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
            width: size.width,
            child: Column(children: [
              Icon(Icons.cloud_upload, size: 60.sp),
              AppText(text: 'Tap to Upload photo', size: 14),
            ])),
        SizedBox(height: size.height * 0.08),
        AccountButton(
            width: size.width,
            height: size.height * 0.06,
            radius: size.width * 0.03,
            // ontap: () {},
            child: AppText(
                text: 'Procced',
                size: 14,
                color: Appcolors.white,
                fontweight: FontWeight.w600))
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key, required this.size});

  final Size size;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    bool showDropdown = false;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppshadowContainer(
          shadowcolour: Appcolors.blue.withOpacity(0.15),
          padding: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.02,
              vertical: widget.size.width * 0.03),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppText(
                text: 'Select Craft', size: 16, fontweight: FontWeight.w500),
            AppshadowContainer(
                onTap: () => setState(() {
                      showDropdown = !showDropdown;
                      log(showDropdown.toString());
                    }),
                padding: EdgeInsets.symmetric(
                    horizontal: widget.size.width * 0.02,
                    vertical: widget.size.width * 0.02),
                child: Icon(Icons.keyboard_arrow_down, size: 25.sp))
          ])),
      showDropdown == true
          ? AppshadowContainer(
              width: widget.size.width,
              shadowcolour: Appcolors.lightgrey.withOpacity(0.4),
              padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.02,
                  vertical: widget.size.width * 0.03),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      5,
                      (index) => AppshadowContainer(
                          margin:
                              EdgeInsets.only(bottom: widget.size.width * 0.02),
                          padding: EdgeInsets.symmetric(
                              horizontal: widget.size.width * 0.02,
                              vertical: widget.size.width * 0.04),
                          width: widget.size.width,
                          color: Appcolors.orange.withOpacity(0.08),
                          shadowcolour: Appcolors.white,
                          child: AppText(
                              text: 'cctv Instaler',
                              fontweight: FontWeight.w500)))))
          : const SizedBox.shrink()
    ]);
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            color: Appcolors.blue,
            text: 'Face Capture',
            size: 30,
            fontweight: FontWeight.w700),
        const AppText(
            fontweight: FontWeight.w500,
            size: 16,
            text: "We want to be sure you are not a robot"),
        SizedBox(height: size.height * 0.02),
        AppshadowContainer(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.width * 0.03),
            child: Column(
                children: List.generate(
                    3,
                    (index) => AppshadowContainer(
                        radius: size.width * 0.02,
                        shadowcolour: Appcolors.white,
                        color: Appcolors.orange.withOpacity(0.1),
                        margin: EdgeInsets.only(bottom: size.width * 0.02),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.02),
                        width: size.width,
                        child: const AppText(text: 'NIN'))))),
        SizedBox(height: size.height * 0.08),
        AccountButton(
            width: size.width,
            height: size.height * 0.06,
            radius: size.width * 0.03,
            // ontap: () {},
            child: AppText(
                text: 'Procced',
                size: 14,
                color: Appcolors.white,
                fontweight: FontWeight.w600))
      ],
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            color: Appcolors.blue,
            text: 'Upload Means of Identification',
            size: 30,
            fontweight: FontWeight.w700),
        const AppText(
            fontweight: FontWeight.w500,
            size: 16,
            text: "We want to be sure you are not a robot"),
        SizedBox(height: size.height * 0.02),
        const AcctTextfield(),
        SizedBox(height: size.height * 0.02),
        AppshadowContainer(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.width * 0.03)),
        SizedBox(height: size.height * 0.04),
        AppshadowContainer(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02, vertical: size.width * 0.03)),
        SizedBox(height: size.height * 0.08),
        AccountButton(
            width: size.width,
            height: size.height * 0.06,
            radius: size.width * 0.03,
            // ontap: () {},
            child: AppText(
                text: 'Procced',
                size: 14,
                color: Appcolors.white,
                fontweight: FontWeight.w600))
      ],
    );
  }
}
