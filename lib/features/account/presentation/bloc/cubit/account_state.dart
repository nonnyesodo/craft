part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class AccountLoadingState extends AccountState {}

final class AccountLoadedState extends AccountState {}

final class ImagePickedState extends AccountState {}

final class AccountUpdatedState extends AccountState {}

final class AccountError extends AccountState {
  final String error;
  const AccountError({required this.error});
  @override
  List<Object> get props => [];
}
