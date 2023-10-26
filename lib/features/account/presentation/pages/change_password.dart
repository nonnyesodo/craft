import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/exports.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            ChangepasswordAppbar(size: size),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Appcolors.white,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.04),
                  ChanePasswordTextfields(size: size),
                  SizedBox(height: size.height * 0.04),
                  ChangePasswordButon(size: size)
                ],
              ),
            ))
          ],
        ));
  }
}

class ChangePasswordButon extends StatelessWidget {
  const ChangePasswordButon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AccountButton(
      width: size.width,
      height: size.height * 0.06,
      radius: size.width * 0.03,
      ontap: () {},
      child: AppText(
          text: 'Confirm',
          color: Appcolors.blue,
          fontweight: FontWeight.w700,
          size: 14),
    );
  }
}

class ChanePasswordTextfields extends StatelessWidget {
  const ChanePasswordTextfields({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppshadowContainer(
        child: Column(
      children: [
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Current Password',
            obscure: true,
            suffixicon: Icon(Icons.visibility, size: 25.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'New Password',
            obscure: true,
            suffixicon: Icon(Icons.visibility, size: 25.sp)),
        SizedBox(height: size.height * 0.02),
        AcctTextfield(
            hintext: 'Confirm Password',
            obscure: true,
            suffixicon: Icon(Icons.visibility, size: 25.sp)),
        SizedBox(height: size.height * 0.02),
      ],
    ));
  }
}

class ChangepasswordAppbar extends StatelessWidget {
  const ChangepasswordAppbar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: const CustomAppbar(title: 'Change Password'),
    );
  }
}
