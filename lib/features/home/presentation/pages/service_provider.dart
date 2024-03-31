import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/home_cubit.dart';
import '../widget/export.dart';

class ServiceProviderDetail extends StatelessWidget {
  const ServiceProviderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final watchHome = context.watch<HomeCubit>();

    final size = MediaQuery.sizeOf(context);
    return BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is BookedArtisan) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return BookingSuccesDialog(size: size);
                });
          }
        },
        child: AppScaffold(
            loadWithloader: watchHome.state is HomeLoading,
            color: Appcolors.blue,
            body: Column(children: [
              SizedBox(height: size.height * 0.01),
              CustomAppbar(title: watchHome.selectedCategory),
              SizedBox(height: size.height * 0.02),
              Expanded(
                  child: Container(
                      width: size.width,
                      color: Appcolors.white,
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            SizedBox(height: size.height * 0.025),
                            ProfilePIc(size: size),
                            SizedBox(height: size.height * 0.01),
                            JobAndTaskInfo(size: size),
                            SizedBox(height: size.height * 0.02),
                            AboutArtisan(size: size),
                            CostAndDistanceValues(size: size),
                            SizedBox(height: size.height * 0.025),
                            PersonalInformation(size: size),
                            SizedBox(height: size.height * 0.02),
                            ImagesAndVideo(size: size),
                          ])))),
              BookNow(size: size)
            ])));
  }
}
