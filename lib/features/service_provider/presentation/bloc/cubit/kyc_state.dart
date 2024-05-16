part of 'kyc_cubit.dart';

sealed class KycState extends Equatable {
  const KycState();

  @override
  List<Object> get props => [];
}

final class KycInitial extends KycState {}

final class KycLoadingState extends KycState {}

final class KycLoadedState extends KycState {}
