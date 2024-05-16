import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/export.dart';
import 'package:craftman/features/account/presentation/bloc/cubit/account_cubit.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_button.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_textfield.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/home/presentation/widget/src/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final watchAccCubit = context.watch<AccountCubit>();
    final readAccCubit = context.read<AccountCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    final size = MediaQuery.sizeOf(context);
    return BlocListener<AccountCubit, AccountState>(
        listener: (context, state) {
          if (state is AccountUpdatedState) {
            Navigator.pop(context);
          }
        },
        child: AppScaffold(
            isloading: watchAccCubit.state is AccountLoadingState,
            color: Appcolors.blue,
            body: Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.width * 0.02),
                  child: const CustomAppbar(title: 'Profile')),
              SizedBox(height: size.height * 0.08),
              Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      width: size.width,
                      color: Appcolors.white,
                      child: Stack(clipBehavior: Clip.none, children: [
                        Positioned(
                            top: -55,
                            child: ProfilePic(
                                size: size,
                                height: size.width * 0.3,
                                width: size.width * 0.3,
                                radius: size.width * 0.2)),
                        Positioned(
                            top: size.height * 0.028,
                            right: size.width * 0.6,
                            child: GestureDetector(
                                onTap: () => showModalBottomSheet(
                                    isDismissible: false,
                                    context: context,
                                    builder: ((context) {
                                      return const ChangeProfilePixModalSheet();
                                    })),
                                child: CircleAvatar(
                                  backgroundColor: Appcolors.orange,
                                  child: Icon(Icons.camera,
                                      size: 25.sp, color: Appcolors.white),
                                ))),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: size.height * 0.1,
                            child: AcctDetailInputfield(
                                controller: watchAuthCubit.firstNameController,
                                onTaptoEnable: () =>
                                    readAccCubit.selectAcctfieldToEnable(
                                        enablefield: 'Fullname'),
                                prefixIcon:
                                    Icon(Icons.account_circle, size: 20.sp),
                                size: size,
                                label: 'FullName',
                                enable:
                                    watchAccCubit.enableAcctfield == 'Fullname',
                                editIconColor:
                                    watchAccCubit.enableAcctfield == 'Fullname'
                                        ? Appcolors.green
                                        : Appcolors.lightgrey)),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: size.height * 0.2,
                            child: AcctDetailInputfield(
                                controller: watchAuthCubit.phoneController,
                                keyboardtype: TextInputType.number,
                                onTaptoEnable: () =>
                                    readAccCubit.selectAcctfieldToEnable(
                                        enablefield: 'Phone'),
                                prefixIcon:
                                    Icon(Icons.phone_android, size: 20.sp),
                                size: size,
                                label: 'Mobile',
                                enable:
                                    watchAccCubit.enableAcctfield == 'Phone',
                                editIconColor:
                                    watchAccCubit.enableAcctfield == 'Phone'
                                        ? Appcolors.green
                                        : Appcolors.lightgrey)),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: size.height * 0.3,
                            child: AcctDetailInputfield(
                                controller: watchAuthCubit.emailController,
                                keyboardtype: TextInputType.emailAddress,
                                size: size,
                                prefixIcon: Icon(Icons.email, size: 20.sp),
                                label: 'Email',
                                enable: false,
                                showsufixicon: false,
                                editIconColor:
                                    watchAccCubit.enableAcctfield == 'email'
                                        ? Appcolors.green
                                        : Appcolors.lightgrey)),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: size.height * 0.4,
                            child: AcctDetailInputfield(
                                onTaptoEnable: () =>
                                    readAccCubit.selectAcctfieldToEnable(
                                        enablefield: 'Address'),
                                prefixIcon:
                                    Icon(Icons.location_pin, size: 20.sp),
                                size: size,
                                label: 'Address',
                                enable:
                                    watchAccCubit.enableAcctfield == 'Address',
                                editIconColor:
                                    watchAccCubit.enableAcctfield == 'Address'
                                        ? Appcolors.green
                                        : Appcolors.lightgrey)),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: size.height * 0.55,
                            child: AccountButton(
                                isloading:
                                    watchAccCubit.state is AccountLoadingState,
                                width: size.width,
                                height: size.height * 0.06,
                                radius: size.width * 0.03,
                                ontap: () {
                                  readAccCubit.updateUserProfile(
                                      mobile:
                                          watchAuthCubit.phoneController.text);
                                },
                                child: AppText(
                                    text: 'Confirm',
                                    color: Appcolors.white,
                                    fontweight: FontWeight.w600))),
                      ])))
            ])));
  }
}

class ChangeProfilePixModalSheet extends StatelessWidget {
  const ChangeProfilePixModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Appcolors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(size.width * 0.03),
                topLeft: Radius.circular(size.width * 0.03))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSelector(
                  title: 'Camera',
                  icon: Icons.photo_camera_outlined,
                  onTap: () => context
                      .read<AccountCubit>()
                      .uploadPhoto(img: ImageSource.camera)),
              SizedBox(width: size.width * 0.2),
              ImageSelector(
                  title: 'Gallery',
                  icon: Icons.photo_library_outlined,
                  onTap: () => context
                      .read<AccountCubit>()
                      .uploadPhoto(img: ImageSource.gallery)),
            ],
          ),
          SizedBox(height: size.height * 0.04),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel, color: Appcolors.redColor, size: 25.sp),
                AppText(
                    text: 'Cancel',
                    color: Appcolors.redColor,
                    fontweight: FontWeight.w800),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.04),
        ]));
  }
}

class ImageSelector extends StatelessWidget {
  const ImageSelector(
      {super.key, this.onTap, required this.title, required this.icon});
  final Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(children: [
          Icon(icon, size: 25.sp),
          AppText(
              text: title, color: Appcolors.blue, fontweight: FontWeight.w500)
        ]));
  }
}

class AcctDetailInputfield extends StatelessWidget {
  const AcctDetailInputfield(
      {super.key,
      required this.size,
      required this.label,
      this.controller,
      this.onTaptoEnable,
      required this.enable,
      this.prefixIcon,
      this.showsufixicon = true,
      this.keyboardtype,
      required this.editIconColor});

  final Size size;
  final String label;
  final TextEditingController? controller;
  final Function()? onTaptoEnable;
  final bool enable, showsufixicon;
  final Widget? prefixIcon;
  final TextInputType? keyboardtype;
  final Color editIconColor;

  @override
  Widget build(BuildContext context) {
    return AppshadowContainer(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: size.width * 0.03, vertical: size.width * 0.02),
      width: size.width,
      // height: size.height * 0.04,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              text: label,
              color: Appcolors.blue,
              fontweight: FontWeight.w500,
              size: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.03,
                width: size.width * 0.7,
                child: AcctTextfield(
                  keyboardtype: keyboardtype,
                  prefixicon: prefixIcon,
                  enabled: enable,
                  controller: controller,
                  noborder: true,
                ),
              ),
              Visibility(
                visible: showsufixicon,
                child: GestureDetector(
                    onTap: onTaptoEnable,
                    child: Icon(Icons.edit, size: 25.sp, color: editIconColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
