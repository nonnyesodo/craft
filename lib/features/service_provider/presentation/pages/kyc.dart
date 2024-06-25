import 'package:craftman/constants/export.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_button.dart';
import 'package:craftman/features/account/presentation/widgets/src/account_textfield.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/authentication/presentation/src/auth_widgets_export.dart';
import 'package:craftman/features/service_provider/presentation/bloc/cubit/kyc_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/local/kyc_static_repo.dart';

class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  double? progress;
  final kycController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final user = context.watch<AuthCubit>().user;

    return AppScaffold(
        color: Appcolors.blue,
        body: Column(children: [
          CustomAppbar(
            title: 'Welcome ${user.firstName}',
            onTap: () {
              kycController.page!.toInt() == 0
                  ? Navigator.pop(context)
                  : kycController.previousPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut);
            },
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  width: size.width,
                  color: Appcolors.white,
                  child: Column(children: [
                    SizedBox(height: size.height * 0.01),
                    KycProgress(
                        size: size, progress: progress ?? size.width / 4),
                    SizedBox(height: size.height * 0.02),
                    Expanded(
                        child: PageView(
                            onPageChanged: (value) {
                              setState(() {
                                switch (value) {
                                  case 0:
                                    progress = size.width / 4;
                                  case 1:
                                    progress = size.width / 4 * (value + 1);
                                  case 2:
                                    progress = size.width / 4 * (value + 1);
                                  case 3:
                                    progress = size.width / 4 * (value + 1);
                                }
                              });
                            },
                            controller: kycController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                          FirstPage(size: size),
                          SecondPage(size: size),
                          ThirdPage(size: size),
                          FourthPage(size: size)
                        ])),
                    AccountButton(
                        width: size.width,
                        height: size.height * 0.06,
                        radius: size.width * 0.03,
                        ontap: () {
                          kycController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut);
                        },
                        child: AppText(
                            text: 'Procced',
                            size: 14,
                            color: Appcolors.white,
                            fontweight: FontWeight.w600)),
                    SizedBox(height: size.height * 0.05),
                  ])))
        ]));
  }
}

class KycProgress extends StatelessWidget {
  const KycProgress({super.key, required this.size, required this.progress});

  final Size size;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppshadowContainer(
            shadowcolour: Appcolors.white,
            width: size.width,
            height: size.height * 0.02,
            color: Appcolors.lightgrey),
        AnimatedContainer(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.03),
                color: Appcolors.orange),
            height: size.height * 0.02,
            width: progress,
            duration: const Duration(milliseconds: 500))
      ],
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final watchAuth = context.watch<AuthCubit>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              color: Appcolors.blue,
              size: 23,
              text: 'Fill Your Personal\nInformation',
              fontweight: FontWeight.w700),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              controller: watchAuth.firstNameController,
              hintext: 'First Name',
              prefixicon: Icon(Icons.work, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              controller: watchAuth.lastNameController,
              hintext: 'Last Name',
              prefixicon: Icon(Icons.work, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              controller: watchAuth.emailController,
              hintext: 'Email ',
              prefixicon: Icon(Icons.work, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              hintext: 'Ofiice Address',
              prefixicon: Icon(Icons.location_pin, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              hintext: 'Alt Address',
              prefixicon: Icon(Icons.location_pin, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              controller: watchAuth.passwordController,
              hintext: 'Phone',
              prefixicon: Icon(Icons.phone_android, size: 20.sp)),
          SizedBox(height: size.height * 0.02),
          AcctTextfield(
              // controller: watchAuth.passwordController,
              hintext: 'About you',
              prefixicon: Icon(Icons.person_2, size: 20.sp)),
          SizedBox(height: size.height * 0.08),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final allImages = context.watch<KycCubit>().allImages;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              color: Appcolors.blue,
              text: 'Fill Your Craft\nInformation',
              size: 23,
              fontweight: FontWeight.w700),
          SizedBox(height: size.height * 0.03),
          AppshadowContainer(
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return ListOfCraftModalSheet(size: size);
                }),
            shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
            padding: EdgeInsets.all(size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                    text: 'Select Craft',
                    size: 16,
                    fontweight: FontWeight.w500),
                Icon(Icons.arrow_downward_outlined,
                    size: 25.sp, color: Appcolors.blue)
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          const AppText(text: 'How much do you charge', size: 14),
          SizedBox(height: size.height * 0.01),
          const AcctTextfield(hintext: '\$20 Per Installation '),
          SizedBox(height: size.height * 0.03),
          const AppText(
              text: 'Upload photos of your craft(minimum of 5 photos)',
              size: 14),
          SizedBox(height: size.height * 0.01),
          AppshadowContainer(
              shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
              width: size.width,
              child: allImages.isNotEmpty
                  ? Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: size.width * 0.04,
                      runSpacing: size.width * 0.04,
                      children: List.generate(
                          allImages.length,
                          (index) => Image.file(allImages[index],
                              width: size.width * 0.4,
                              height: size.width * 0.4,
                              fit: BoxFit.cover)))
                  : GestureDetector(
                      onTap: () =>
                          context.read<KycCubit>().selectArtisanImages(),
                      child: Column(children: [
                        Icon(Icons.cloud_upload, size: 60.sp),
                        const AppText(text: 'Tap to Upload photo', size: 14),
                      ]),
                    )),
          SizedBox(height: size.height * 0.08),
        ],
      ),
    );
  }
}

class ListOfCraftModalSheet extends StatelessWidget {
  const ListOfCraftModalSheet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.02),
            const AppText(
                text: 'Select Craft', size: 16, fontweight: FontWeight.w500),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: ListView(
                    children: List.generate(
                        KycStaticRepo.craft.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.width * 0.02),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                        text: KycStaticRepo.craft[index],
                                        fontweight: FontWeight.w600),
                                    AuthCheckbox(
                                        status: true,
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        radius: size.width * 0.03)
                                  ],
                                ),
                              ),
                            ))))
          ]),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final id = context.watch<KycCubit>().id;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              color: Appcolors.blue,
              text: 'Select  Means of\nIdentification',
              size: 23,
              fontweight: FontWeight.w700),
          const AppText(
              fontweight: FontWeight.w500,
              size: 16,
              text: "We want to be sure you are not a robot"),
          SizedBox(height: size.height * 0.02),
          IdTypeDropdown(size: size),
          SizedBox(height: size.height * 0.06),
          AppshadowContainer(
              shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
              width: size.width,
              child: id != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                      child: Image.file(id,
                          filterQuality: FilterQuality.high,
                          width: size.width * 0.55,
                          height: size.width * 0.55,
                          fit: BoxFit.cover),
                    )
                  : GestureDetector(
                      onTap: () => context
                          .read<KycCubit>()
                          .selectArtisanId(ImageSource.gallery),
                      child: Column(children: [
                        Icon(Icons.cloud_upload, size: 60.sp),
                        const AppText(text: 'Tap to Upload Front Id', size: 14),
                      ]),
                    )),
          SizedBox(height: size.height * 0.05),
          AppshadowContainer(
              shadowcolour: Appcolors.lightgrey.withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
              width: size.width,
              child: id != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                      child: Image.file(id,
                          filterQuality: FilterQuality.high,
                          width: size.width * 0.5,
                          height: size.width * 0.5,
                          fit: BoxFit.cover),
                    )
                  : GestureDetector(
                      onTap: () => context
                          .read<KycCubit>()
                          .selectArtisanId(ImageSource.gallery),
                      child: Column(children: [
                        Icon(Icons.cloud_upload, size: 60.sp),
                        const AppText(text: 'Tap to Upload Back Id', size: 14),
                      ]),
                    )),
        ],
      ),
    );
  }
}

class IdTypeDropdown extends StatefulWidget {
  const IdTypeDropdown({super.key, required this.size});

  final Size size;

  @override
  State<IdTypeDropdown> createState() => _IdTypeDropdownState();
}

class _IdTypeDropdownState extends State<IdTypeDropdown> {
  bool showDropdown = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppshadowContainer(
            onTap: () => setState(() {
                  showDropdown = !showDropdown;
                }),
            shadowcolour: Appcolors.lightgrey.withOpacity(0.4),
            width: widget.size.width,
            padding: EdgeInsets.symmetric(
                horizontal: widget.size.width * 0.02,
                vertical: widget.size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                    text: 'Select Id Type',
                    fontweight: FontWeight.w600,
                    size: 16),
                Icon(Icons.keyboard_arrow_down,
                    size: 25.sp, color: Appcolors.blue)
              ],
            )),
        Visibility(
          visible: showDropdown,
          child: AppshadowContainer(
              shadowcolour: Appcolors.lightgrey.withOpacity(0.4),
              width: widget.size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.02,
                  vertical: widget.size.width * 0.03),
              child: Column(
                  children: List.generate(
                KycStaticRepo.ids.length,
                (index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                            text: KycStaticRepo.ids[index],
                            fontweight: FontWeight.w600,
                            size: 16),
                        AuthCheckbox(
                            status: false,
                            width: widget.size.width * 0.07,
                            height: widget.size.width * 0.07,
                            radius: widget.size.width * 0.01)
                      ],
                    ),
                    Visibility(visible: index != 3, child: const Divider())
                  ],
                ),
              ))),
        ),
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
            text: 'Face Capture',
            size: 30,
            fontweight: FontWeight.w700),
        SizedBox(height: size.height * 0.01),
        const AppText(
            fontweight: FontWeight.w500,
            size: 16,
            text:
                "We want to be sure you are not a robot, Click On the camera icon to start capture"),
        SizedBox(height: size.height * 0.08),
        Center(
            child: AppshadowContainer(
                border: true,
                width: size.width * 0.6,
                height: size.width * 0.6,
                radius: size.width * 0.3)),
        SizedBox(height: size.height * 0.02),
        Center(
            child: AppshadowContainer(
                padding: EdgeInsets.all(size.width * 0.02),
                radius: size.width * 0.1,
                color: Appcolors.blue,
                onTap: () => context.read<KycCubit>().startDetection(),
                child: Icon(Icons.camera,
                    color: Appcolors.lightgrey, size: 40.sp)))
      ],
    );
  }
}
