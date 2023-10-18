import 'package:bloc/bloc.dart';
import 'package:craftman/features/account/presentation/pages/account_page.dart';
import 'package:craftman/features/home/presentation/pages/home_screen.dart';
import 'package:equatable/equatable.dart';
import '../../../../message/presentation/pages/messages.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int bottonnavSelectedIndex = 0;
  int onboardindicatindex = 0;
  final screens = [const HomePage(), const Messages(), const AccountPage()];
  delaySplash() async {
    emit(OnboardingLoadingState());
    await Future.delayed(const Duration(seconds: 8));
    emit(OnboardingLoadedState());
  }

  void changebottomnavindex({required int index}) {
    emit(OnboardingLoadingState());
    bottonnavSelectedIndex = index;
    emit(OnboardingLoadedState());
  }

  increaseOnboardingindex(int index) {
    emit(OnboardingLoadingState());
    onboardindicatindex += index;
    emit(OnboardingLoadedState());
  }

  decreaseOnboardingindex(int index) {
    emit(OnboardingLoadingState());
    onboardindicatindex -= index;
    emit(OnboardingLoadedState());
  }
}
