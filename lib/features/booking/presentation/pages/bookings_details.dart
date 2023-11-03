import 'package:craftman/features/authentication/presentation/widget/export.dart';
import 'package:craftman/features/booking/presentation/bloc/cubit/booking_cubit.dart';
import 'package:craftman/features/booking/presentation/widgets/exports.dart';
import 'package:craftman/features/home/presentation/widget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/export.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: const CustomAppbar(title: 'Completed'),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.width * 0.02),
              color: Appcolors.white,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      ProfilePic(
                          size: size,
                          height: size.width * 0.2,
                          width: size.width * 0.2,
                          radius: size.width * 0.1),
                      SizedBox(width: size.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: 'Jame Doe',
                              color: Appcolors.blue,
                              fontweight: FontWeight.w600),
                          AppText(
                              text: 'JamesDoe@gmail.com',
                              size: 14,
                              color: Appcolors.lightgrey,
                              fontweight: FontWeight.w600),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 20.sp, color: Appcolors.yellow),
                              AppText(
                                  text: '4.0', color: Appcolors.blue, size: 14),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  const BookingDetailInfo(
                      title: 'Booking ID', value: '#123bnnfh'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(title: 'Services', value: 'Plumbing'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(
                      title: 'Date', value: 'Monday,june 24th '),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(title: 'Time', value: '02:20PM'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(
                      title: 'Price Details', value: '\$300'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(
                      title: 'Method Of Payment', value: 'Cash'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(title: 'Status', value: 'Completed'),
                  SizedBox(height: size.height * 0.01),
                  const BookingDetailInfo(
                      title: 'Total Amount', value: '\$300'),
                  SizedBox(height: size.height * 0.06),
                  AppText(
                      text: 'You haven\'t rated yet?',
                      color: Appcolors.blue,
                      fontweight: FontWeight.w500),
                  SizedBox(height: size.height * 0.02),
                  BookingButton(
                    width: size.width,
                    height: size.height * 0.055,
                    radius: size.width * 0.02,
                    child: AppText(
                        text: 'Rate Now',
                        size: 12,
                        color: Appcolors.white,
                        fontweight: FontWeight.w600),
                    ontap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return RatingModalSheet();
                        }),
                  ),
                  SizedBox(height: size.height * 0.02),
                  BookingButton(
                      boderColor: Appcolors.orange,
                      buttoncolor: Appcolors.white,
                      width: size.width,
                      height: size.height * 0.055,
                      radius: size.width * 0.02,
                      child: AppText(
                          text: 'Request Invoice',
                          size: 12,
                          color: Appcolors.blue,
                          fontweight: FontWeight.w600),
                      ontap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AuthAcctCreatedDialog(size: size);
                          })),
                ],
              ),
            ))
          ],
        ));
  }
}

class AuthAcctCreatedDialog extends StatelessWidget {
  const AuthAcctCreatedDialog({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        width: size.width,
        decoration: BoxDecoration(
            color: Appcolors.white,
            borderRadius: BorderRadius.circular(size.width * 0.03)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.02),
            Icon(
              Icons.verified_user,
              size: 100.sp,
              color: Appcolors.blue,
            ),
            SizedBox(height: size.height * 0.02),
            AppText(
                text: 'Account Created',
                fontweight: FontWeight.w700,
                color: Appcolors.blue),
            SizedBox(height: size.height * 0.01),
            AppText(
                text: 'Your account has been successfully created!',
                size: 14,
                color: Appcolors.blue,
                textalign: TextAlign.center),
            SizedBox(height: size.height * 0.02),
            AuthButton(
              width: size.width,
              height: size.height * 0.05,
              radius: size.width * 0.02,
              ontap: () {},
              child: AppText(
                  text: 'Procced',
                  size: 12,
                  color: Appcolors.white,
                  fontweight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

class RatingModalSheet extends StatelessWidget {
  const RatingModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchBookingCubit = context.watch<BookingCubit>();

    final readBookingCubit = context.read<BookingCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width,
      decoration: BoxDecoration(
          color: Appcolors.white,
          borderRadius: BorderRadius.circular(size.width * 0.02)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.height * 0.02),
          AppText(
              text: 'Rate your experience with',
              size: 16,
              color: Appcolors.blue,
              fontweight: FontWeight.w500),
          AppText(
              text: 'Nonny esodo',
              fontweight: FontWeight.w600,
              color: Appcolors.blue),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => GestureDetector(
                      onTap: () =>
                          readBookingCubit.chnageStarRating(index: index + 1),
                      child: Icon(Icons.star,
                          size: 35.sp,
                          color: index >= watchBookingCubit.starratingIndex
                              ? Appcolors.lightgrey
                              : Appcolors.yellow),
                    )),
          ),
          SizedBox(height: size.height * 0.02),
          AppText(
              text: 'Share a public review',
              color: Appcolors.blue,
              fontweight: FontWeight.w500),
          SizedBox(height: size.height * 0.01),
          BookingTextfield(maxline: 6, hintext: 'Write about your experiance'),
          SizedBox(height: size.height * 0.04),
          BookingButton(
            width: size.width,
            height: size.height * 0.05,
            radius: size.width * 0.02,
            child: AppText(
                text: 'Confirm',
                size: 14,
                color: Appcolors.white,
                fontweight: FontWeight.w600),
          ),
          SizedBox(height: size.height * 0.035),
        ],
      ),
    );
  }
}

class BookingDetailInfo extends StatelessWidget {
  const BookingDetailInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontweight: FontWeight.w600,
          color: Appcolors.blue,
        ),
        AppText(text: value, size: 16, color: Appcolors.blue)
      ],
    );
  }
}
