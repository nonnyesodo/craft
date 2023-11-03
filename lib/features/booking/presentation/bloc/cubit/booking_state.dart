part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoadingState extends BookingState {}

final class BookingLoadedState extends BookingState {}

final class BookingErrorState extends BookingState {
  final String error;
  const BookingErrorState({required this.error});
  @override
  List<Object> get props => [];
}
