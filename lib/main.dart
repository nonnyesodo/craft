import 'package:craftman/config/page%20route/detail/route.dart';
import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/account/presentation/bloc/cubit/account_cubit.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/booking/presentation/bloc/cubit/booking_cubit.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => AccountCubit()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: MediaQuery.sizeOf(context),
          builder: (context, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Craftman',
                theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true),
                initialRoute: RouteName.splash,
                onGenerateRoute: AppRoute.onGeneratedRoute);
          }),
    );
  }
}
