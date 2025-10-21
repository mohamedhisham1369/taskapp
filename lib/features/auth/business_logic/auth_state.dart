part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

/// Login States
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {}

/// Pick Image States
final class PickImageSuccessState extends AuthState {}

final class PickImageErrorState extends AuthState {}

/// Register States
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {}

/// Toggle Password States
final class TogglePasswordState extends AuthState {}

final class TogglePasswordState2 extends AuthState {}
/// Countdown States
class CountdownUpdated extends AuthState {
  final int seconds;
  final bool canResend;

  CountdownUpdated(this.seconds, this.canResend);
}
