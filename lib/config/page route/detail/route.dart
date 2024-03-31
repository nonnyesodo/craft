import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/features/account/presentation/pages/account_details.dart';
import 'package:craftman/features/account/presentation/pages/change_password.dart';
import 'package:craftman/features/account/presentation/pages/contact_us.dart';
import 'package:craftman/features/account/presentation/pages/notifications.dart';
import 'package:craftman/features/account/presentation/pages/service_provider_form.dart';
import 'package:craftman/features/authentication/presentation/pages/email_otp.dart';
import 'package:craftman/features/authentication/presentation/pages/login_page.dart';
import 'package:craftman/features/authentication/presentation/pages/mobile_0tp.dart';
import 'package:craftman/features/authentication/presentation/pages/signup_page.dart';
import 'package:craftman/features/booking/presentation/pages/bookings_details.dart';
import 'package:craftman/features/home/presentation/pages/category_page.dart';
import 'package:craftman/features/home/presentation/pages/chat.dart';
import 'package:craftman/features/home/presentation/pages/reviews.dart';
import 'package:craftman/features/home/presentation/pages/service_provider.dart';
import 'package:craftman/features/home/presentation/pages/skills_detail_page.dart';
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
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const SplashScreen());
      case RouteName.firstonboarding:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const FirstOnboarding());
      case RouteName.secondonboarding:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const SecondOnboard());
      case RouteName.thirdonboarding:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const ThirdOnboard());
      case RouteName.bottomNav:
        return CustomPageRoute(child: const BottomNav());
      case RouteName.fourthonboarding:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const Onboarding4());
      case RouteName.signup:
        return CustomPageRoute(child: const SignupPage());
      case RouteName.login:
        return CustomPageRoute(child: const LoginPage());
      case RouteName.mobileOtp:
        return CustomPageRoute(child: const MobileOtp());
      case RouteName.skilldetail:
        return CustomPageRoute(child: const SkillsDetail());
      case RouteName.serviceproviderdetail:
        return CustomPageRoute(child: const ServiceProviderDetail());
      case RouteName.chat:
        return CustomPageRoute(child: const Chats());
      case RouteName.changepassword:
        return CustomPageRoute(child: const ChangePassword());
      case RouteName.emailotp:
        return CustomPageRoute(child: const EmailOtp());
      case RouteName.reviews:
        return CustomPageRoute(child: const Reviews());
      case RouteName.categories:
        return CustomPageRoute(child: const Categories());
      case RouteName.accountdetail:
        return CustomPageRoute(child: const AccountDetails());
      case RouteName.bookingDetail:
        return CustomPageRoute(child: const BookingDetail());
      case RouteName.serviceProviderform:
        return CustomPageRoute(child: const ServiceProviderForm());
      case RouteName.contactUs:
        return CustomPageRoute(child: const ContactUs());
      case RouteName.notification:
        return CustomPageRoute(child: const Notifications());
      default:
        return CustomPageRoute(child: const LoginPage());
    }
  }
}
