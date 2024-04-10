import 'package:craftman/constants/util/useful_methods.dart';
import 'package:craftman/features/authentication/presentation/src/auth_widgets_export.dart';
import 'package:craftman/features/authentication/presentation/src/widget/authbutton.dart';
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
    final selectedBooking = context.watch<BookingCubit>().selectedBooking;
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(children: [
          CustomAppbar(title: selectedBooking.status!),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.width * 0.02),
                  color: Appcolors.white,
                  width: size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Row(children: [
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
                                    text: '${selectedBooking.artisanName}',
                                    color: Appcolors.blue,
                                    fontweight: FontWeight.w600),
                                AppText(
                                    text: 'JamesDoe@gmail.com',
                                    size: 14,
                                    color: Appcolors.lightgrey,
                                    fontweight: FontWeight.w600),
                                Row(children: [
                                  Icon(Icons.star,
                                      size: 20.sp, color: Appcolors.yellow),
                                  AppText(
                                      text: '4.0',
                                      color: Appcolors.blue,
                                      size: 14)
                                ])
                              ])
                        ]),
                        SizedBox(height: size.height * 0.02),
                        BookingDetailInfo(
                            title: 'Booking ID',
                            value: '${selectedBooking.referenceNumber}'),
                        SizedBox(height: size.height * 0.01),
                        const BookingDetailInfo(
                            title: 'Services', value: 'Plumbing'),
                        SizedBox(height: size.height * 0.01),
                        BookingDetailInfo(
                            title: 'Date',
                            value:
                                '${Utils.formatDate(value: selectedBooking.date).day},${Utils.formatDate(value: selectedBooking.date).month} ${Utils.formatDate(value: selectedBooking.date).date} '),
                        SizedBox(height: size.height * 0.01),
                        BookingDetailInfo(
                            title: 'Time',
                            value:
                                '${Utils.formatTime(value: selectedBooking.time)}'),
                        SizedBox(height: size.height * 0.01),
                        BookingDetailInfo(
                            title: 'Price Details',
                            value:
                                '${Utils.formatPrice(value: selectedBooking.cost)}'),
                        SizedBox(height: size.height * 0.01),
                        const BookingDetailInfo(
                            title: 'Method Of Payment', value: 'Cash'),
                        SizedBox(height: size.height * 0.01),
                        const BookingDetailInfo(
                            title: 'Status', value: 'Completed'),
                        SizedBox(height: size.height * 0.01),
                        BookingDetailInfo(
                            title: 'Total Amount',
                            value:
                                '${Utils.formatPrice(value: selectedBooking.cost)}'),
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
                                backgroundColor: Appcolors.white,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: const RatingModalSheet(),
                                  );
                                })),
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
                                fontweight: FontWeight.w600))
                      ])))
        ]));
  }
}

class RatingModalSheet extends StatelessWidget {
  const RatingModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchBookingCubit = context.watch<BookingCubit>();
    final selectedBooking = watchBookingCubit.selectedBooking;
    final readBookingCubit = context.read<BookingCubit>();
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.height * 0.02),
          AppText(
              text: 'Rate your experience with',
              color: Appcolors.blue,
              fontweight: FontWeight.w700),
          AppText(
              text: '${selectedBooking.artisanName}',
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
                          color: index >= watchBookingCubit.starRatingIndex
                              ? Appcolors.lightgrey
                              : Appcolors.orange)))),
          SizedBox(height: size.height * 0.02),
          AppText(
              text: 'Share a public review',
              color: Appcolors.blue,
              fontweight: FontWeight.w500),
          SizedBox(height: size.height * 0.01),
          BookingTextfield(
              controller: watchBookingCubit.ratingController,
              maxline: 6,
              hintext: 'Write about your experiance'),
          SizedBox(height: size.height * 0.04),
          AuthButton(
              isloading: watchBookingCubit.state is BookingLoadingState,
              ontap: () => readBookingCubit.rateArtisan(),
              width: size.width,
              height: size.height * 0.05,
              radius: size.width * 0.02,
              child: AppText(
                  text: 'Confirm',
                  size: 14,
                  color: Appcolors.white,
                  fontweight: FontWeight.w600)),
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
