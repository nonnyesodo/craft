import 'package:craftman/config/page%20route/detail/route.dart';
import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/account/data/remote/acct_repo.dart';
import 'package:craftman/features/account/presentation/bloc/cubit/account_cubit.dart';
import 'package:craftman/features/authentication/data/remote/auth_repo.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/booking/data/remote/booking_repo.dart';
import 'package:craftman/features/booking/presentation/bloc/cubit/booking_cubit.dart';
import 'package:craftman/features/home/data/remote_repo/home_repo.dart';
import 'package:craftman/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:craftman/features/service_provider/presentation/bloc/cubit/kyc_cubit.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          BlocProvider(create: (context) => AuthCubit(AuthRepo())),
          BlocProvider(create: (context) => BookingCubit(BookingRepo())),
          BlocProvider(create: (context) => AccountCubit(AcctRepo())),
          BlocProvider(create: (context) => HomeCubit(HomeRepo())),
          BlocProvider(create: (context) => KycCubit()),
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(360, 690),
            builder: (context, child) {
              return MaterialApp(
                  builder: (context, child) {
                    return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: const TextScaler.linear(0.9)),
                        child: child!);
                  },
                  debugShowCheckedModeBanner: false,
                  title: 'Craftman',
                  theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.white),
                      useMaterial3: true),
                  initialRoute: RouteName.splash,
                  onGenerateRoute: AppRoute.onGeneratedRoute);
            }));
  }
}
