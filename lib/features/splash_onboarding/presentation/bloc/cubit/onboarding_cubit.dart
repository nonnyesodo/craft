import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:craftman/features/account/presentation/pages/account_page.dart';
import 'package:craftman/features/booking/presentation/pages/bookings.dart';
import 'package:craftman/features/home/presentation/pages/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../message/presentation/pages/messages.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial()) {
    getUser();
  }
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

  Future getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Turn on location for better service');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Turn on location for better service');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  Future<String> getUser() async {
    try {
      Position position = (await getUserLocation());
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      log(placemarks[0].toString());
      Placemark place =
          placemarks[0]; // Get the first place object from the list.
      return place.administrativeArea!; // This is typically the state.
    } catch (e) {
      return Future.error('Failed to get user state: $e');
    }
  }

//   getDistanceInKm()async{
//       Position position = (await getUserLocation());
//      double distanceInMeters=   Geolocator.distanceBetween(position.latitude, position.longitude, endLatitude, endLongitude)

//  double distanceInKms=distanceInMeters/1000;
//  return distanceInKms;
//   }
}
