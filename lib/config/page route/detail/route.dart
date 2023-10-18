import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/authentication/presentation/pages/login_page.dart';
import 'package:craftman/features/authentication/presentation/pages/mobile_0tp.dart';
import 'package:craftman/features/authentication/presentation/pages/signup_page.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/onboard4.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/bottomnav.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/onboarding1.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/onboarding2.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/onboarding3.dart';
import 'package:craftman/features/splash_onboarding/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'custom_page_route.dart';

class AppRoute {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return CustomPageRoute(child: const SplashScreen());
      case RouteName.firstonboarding:
        return CustomPageRoute(child: const FirstOnboarding());
      case RouteName.secondonboarding:
        return CustomPageRoute(child: const SecondOnboard());
      case RouteName.thirdonboarding:
        return CustomPageRoute(child: const ThirdOnboard());
      case RouteName.bottomNav:
        return CustomPageRoute(child: const BottomNav());
      case RouteName.fourthonboarding:
        return CustomPageRoute(child: const Onboarding4());
      case RouteName.signup:
        return CustomPageRoute(child: const SignupPage());
      case RouteName.login:
        return CustomPageRoute(child: const LoginPage());
      case RouteName.mobileOtp:
        return CustomPageRoute(child: const MobileOtp());

      default:
        return CustomPageRoute(child: const LoginPage());
    }
  }
}
