import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:craftman/features/booking/data/model/booking_history.dart';
import 'package:craftman/features/booking/data/remote/booking_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingRepo bookingRepo;
  BookingCubit(this.bookingRepo) : super(BookingInitial());

  String bookingFilter = 'Active';
  List<BookingHistoryModel> filteredBooking = [];
  selectBookingFilter({required String filter}) {
    emit(BookingLoadingState());
    filteredBooking.clear();
    bookingFilter = filter;
    if (bookingFilter == 'Active') {
      filteredBooking = allBooking.where((e) => e.status == 'pending').toList();
    } else {
      filteredBooking =
          allBooking.where((e) => e.status == 'completed').toList();
    }
    emit(BookingLoadedState());
  }

  int starRatingIndex = 0;
  chnageStarRating({required int index}) {
    emit(BookingLoadingState());
    starRatingIndex = index;
    log(starRatingIndex.toString());
    emit(BookingLoadedState());
  }

  List<BookingHistoryModel> allBooking = [];
  getbookingHistory() async {
    emit(BookingLoadingState());
    try {
      final response = await bookingRepo.getBookingHistory();
      final body = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        for (var book in body["data"]) {
          allBooking.add(BookingHistoryModel.fromJson(book));
        }
        filteredBooking =
            allBooking.where((e) => e.status == 'pending').toList();
        log(allBooking.length.toString());
        emit(BookingLoadedState());
      } else {
        log(response.body);
        emit(const BookingErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const BookingErrorState(error: 'error'));
      log(e.toString());
    }
  }

  BookingHistoryModel selectedBooking = BookingHistoryModel();
  selectBooking({required BookingHistoryModel booking}) {
    emit(BookingLoadingState());
    selectedBooking = booking;
    emit(BookingLoadedState());
  }

  cancelBooking() async {
    emit(BookingLoadingState());
    try {
      final response = await bookingRepo.cancelBooking(id: selectedBooking.id);
      final body = jsonDecode(response.body);
      log(response.body.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        emit(BookingLoadedState());
      } else {
        emit(const BookingErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const BookingErrorState(error: 'error'));
      log(e.toString());
    }
  }

  final ratingController = TextEditingController();
  rateArtisan() async {
    emit(BookingLoadingState());
    try {
      final response = await bookingRepo.rateArtisan(
          id: selectedBooking.artisanId,
          rating: starRatingIndex,
          review: ratingController.text);
      final body = jsonDecode(response.body);
      log(response.body.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        emit(BookingLoadedState());
      } else {
        emit(const BookingErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const BookingErrorState(error: 'error'));
      log(e.toString());
    }
  }
}
