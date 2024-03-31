import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:craftman/features/booking/data/model/booking_history.dart';
import 'package:craftman/features/booking/data/remote/booking_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingRepo bookingRepo;
  BookingCubit(this.bookingRepo) : super(BookingInitial());
  String bookingFilter = 'Active';
  int starratingIndex = 0;
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

  chnageStarRating({required int index}) {
    emit(BookingLoadingState());
    starratingIndex = index;
    log(starratingIndex.toString());
    emit(BookingLoadedState());
  }

  List<BookingHistoryModel> allBooking = [];
  getbookingHistory() async {
    emit(BookingLoadingState());
    try {
      final response = await bookingRepo.getBookingHistory();
      final body = jsonDecode(response.body);
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
}
