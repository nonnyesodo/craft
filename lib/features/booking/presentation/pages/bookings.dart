import 'package:craftman/config/page%20route/page_route.dart';
import 'package:craftman/constants/export.dart';
import 'package:craftman/features/booking/presentation/bloc/cubit/booking_cubit.dart';
import 'package:craftman/features/booking/presentation/widgets/src/booking_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            BookingAppbar(size: size),
            SizedBox(height: size.height * 0.03),
            Expanded(
                child: Container(
              width: size.width,
              color: Appcolors.white,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  BookingFilter(size: size),
                  SizedBox(height: size.height * 0.02),
                  AllBookings(size: size)
                ],
              ),
            ))
          ],
        ));
  }
}

class AllBookings extends StatelessWidget {
  const AllBookings({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: List.generate(
            8,
            (index) => GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteName.bookingDeatail),
                  child: AppshadowContainer(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.width * 0.03),
                    margin: EdgeInsets.symmetric(
                        vertical: size.width * 0.02,
                        horizontal: size.width * 0.03),
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: '#112335',
                                color: Appcolors.blue,
                                size: 16),
                            BookingButton(
                              width: size.width * 0.25,
                              height: size.height * 0.03,
                              radius: size.width * 0.01,
                              child: AppText(
                                  text: index.isOdd ? 'Completed' : 'Pending',
                                  size: 12,
                                  color: Appcolors.white,
                                  fontweight: FontWeight.w600),
                            )
                          ],
                        ),
                        AppText(
                            text: 'James Dish',
                            color: Appcolors.blue,
                            size: 16,
                            fontweight: FontWeight.w500),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: 'CCtv instalation',
                                fontweight: FontWeight.w600,
                                color: Appcolors.blue),
                            AppText(
                              text: '\$200',
                              size: 14,
                              color: Appcolors.blue,
                              fontweight: FontWeight.w600,
                            )
                          ],
                        ),
                        AppText(
                            text: 'January 25 ,10:24 AM',
                            size: 14,
                            color: Appcolors.blue),
                        Divider(color: Appcolors.lightgrey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone, size: 20.sp),
                                SizedBox(width: size.width * 0.02),
                                AppText(
                                    text: 'Call',
                                    fontweight: FontWeight.w600,
                                    size: 16,
                                    color: Appcolors.blue),
                              ],
                            ),
                            Visibility(
                              visible: !index.isOdd,
                              child: BookingButton(
                                buttoncolor: Appcolors.redColor,
                                width: size.width * 0.3,
                                height: size.height * 0.045,
                                radius: size.width * 0.02,
                                child: AppText(
                                    text: 'Cancel',
                                    size: 12,
                                    color: Appcolors.white,
                                    fontweight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}

class BookingFilter extends StatelessWidget {
  const BookingFilter({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final watchBookingCubit = context.watch<BookingCubit>();
    final readBookingCubit = context.read<BookingCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.5,
          child: GestureDetector(
            onTap: () => readBookingCubit.selectBookingFilter(filter: 'Active'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: AppText(
                        text: 'Active', color: Appcolors.blue, size: 20)),
                ActiveIBookingndicator(
                    size: size,
                    activeColor: watchBookingCubit.bookingFilter == 'Active'
                        ? Appcolors.blue
                        : Appcolors.white),
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.5,
          child: GestureDetector(
            onTap: () =>
                readBookingCubit.selectBookingFilter(filter: 'Completed'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                    child: AppText(
                        text: 'Completed', color: Appcolors.blue, size: 20)),
                ActiveIBookingndicator(
                    size: size,
                    activeColor: watchBookingCubit.bookingFilter == 'Completed'
                        ? Appcolors.blue
                        : Appcolors.white),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BookingAppbar extends StatelessWidget {
  const BookingAppbar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: 'Bookings',
              color: Appcolors.white,
              fontweight: FontWeight.w600),
          const NotificationIcon()
        ],
      ),
    );
  }
}

class ActiveIBookingndicator extends StatelessWidget {
  const ActiveIBookingndicator(
      {super.key, required this.size, required this.activeColor});

  final Size size;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      decoration:
          BoxDecoration(border: Border.all(width: 3.5, color: activeColor)),
    );
  }
}
