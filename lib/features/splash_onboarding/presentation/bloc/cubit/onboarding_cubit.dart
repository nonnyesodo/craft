import 'package:bloc/bloc.dart';
import 'package:craftman/features/account/presentation/pages/account_page.dart';
import 'package:craftman/features/booking/presentation/pages/bookings.dart';
import 'package:craftman/features/home/presentation/pages/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../message/presentation/pages/messages.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int bottonnavSelectedIndex = 0;

  final screens = [
    const HomePage(),
    const Messages(),
    const Bookings(),
    const AccountPage()
  ];
  delaySplash() async {
    emit(OnboardingLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    if (await checkfirstInstall()) {
      emit(Newuserstate());
    } else if (await autologin()) {
      emit(AutoLoginState());
    } else {
      emit(OnboardingLoadedState());
    }
  }

  void changebottomnavindex({required int index}) {
    emit(OnboardingLoadingState());
    bottonnavSelectedIndex = index;
    emit(OnboardingLoadedState());
  }

  checkfirstInstall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firsttime = prefs.getBool('first');

    if (firsttime == null) {
      firsttime = true;
    } else {
      firsttime = false;
    }
    await prefs.setBool('first', true);
    return firsttime;
  }

  Future<bool> autologin() async {
    final sharedPref = await SharedPreferences.getInstance();
    final userInfo = sharedPref.getStringList("login");
    if (userInfo == null) {
      return false;
    }
    return true;
  }
}
