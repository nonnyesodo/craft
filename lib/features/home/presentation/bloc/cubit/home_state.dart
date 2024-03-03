part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {}

final class HomeerrorState extends HomeState {
  final String error;

  const HomeerrorState({required this.error});
  @override
  List<Object> get props => [];
}
