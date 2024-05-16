part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthLoadedState extends AuthState {}

final class AcctDeletedState extends AuthState {}

final class AuthLogoutState extends AuthState {}

final class AuthTokenVerifiedState extends AuthState {}

final class AuthRegisterState extends AuthState {}

final class LoginState extends AuthState {}

final class AuthEmailVerifiedState extends AuthState {}

final class AuthEmailOtpSentState extends AuthState {}

final class InvalidOtpState extends AuthState {
  final String msg;
  const InvalidOtpState({required this.msg});
  @override
  List<Object> get props => [];
}

final class AuthTokenSentState extends AuthState {}

final class AuthErrorState extends AuthState {
  const AuthErrorState({
    required this.error,
  });
  final String error;
  @override
  List<Object> get props => [];
}
