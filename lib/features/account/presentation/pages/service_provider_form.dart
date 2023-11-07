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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: const CustomAppbar(title: 'Welcome Nonny Schwab'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              width: size.width,
              color: Appcolors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppText(
                        color: Appcolors.blue,
                        text: 'Would you like to join our amazing phaltform? '),
                    AppText(
                        color: Appcolors.blue,
                        text:
                            'fill the form below our amazing users cant wait to enjoy your great service'),
                    SizedBox(height: size.height * 0.02),
                    AcctTextfield(
                        hintext: 'Ofiice Address',
                        prefixicon: Icon(Icons.location_pin, size: 20.sp)),
                    SizedBox(height: size.height * 0.02),
                    AcctTextfield(
                        hintext: 'Alt Phone',
                        prefixicon: Icon(Icons.phone_android, size: 20.sp)),
                    SizedBox(height: size.height * 0.02),
                    AcctTextfield(
                        hintext: 'Your services',
                        prefixicon: Icon(Icons.work, size: 20.sp)),
                    SizedBox(height: size.height * 0.04),
                    AppshadowContainer(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.width * 0.04),
                      child: Column(
                        children: [
                          const AppText(
                              size: 14,
                              text:
                                  'Upload Photo of Your works and means of identification e.g NIN,Voters card,driver license etc.'),
                          SizedBox(height: size.height * 0.02),
                          AccountButton(
                              width: size.width,
                              height: size.height * 0.06,
                              radius: size.width * 0.03,
                              child: AppText(
                                  text: 'Select to upload',
                                  size: 14,
                                  fontweight: FontWeight.w600,
                                  color: Appcolors.white),
                              ontap: () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    AccountButton(
                      width: size.width,
                      height: size.height * 0.06,
                      radius: size.width * 0.03,
                      ontap: () {},
                      child: AppText(
                          text: 'Confirm',
                          size: 14,
                          color: Appcolors.white,
                          fontweight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
