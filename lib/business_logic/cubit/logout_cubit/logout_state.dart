
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {}

class LogoutError extends LogoutState {
  String message;

  LogoutError({
    required this.message,
  });
}
