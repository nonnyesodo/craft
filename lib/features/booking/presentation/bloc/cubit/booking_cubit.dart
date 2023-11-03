import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  String bookingFilter = 'Active';
  int starratingIndex = 0;
  selectBookingFilter({required String filter}) {
    emit(BookingLoadingState());
    bookingFilter = filter;
    emit(BookingLoadedState());
  }

  chnageStarRating({required int index}) {
    emit(BookingLoadingState());
    starratingIndex = index;
    log(starratingIndex.toString());
    emit(BookingLoadedState());
  }
}
