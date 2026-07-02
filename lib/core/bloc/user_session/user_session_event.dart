import 'package:equatable/equatable.dart';

abstract class UserSessionEvent extends Equatable {
  const UserSessionEvent();

  @override
  List<Object?> get props => [];
}

/// Set user session data after login.
class SetUserSession extends UserSessionEvent {
  final String name;
  final String email;
  final String? avatarUrl;

  const SetUserSession({
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [name, email, avatarUrl];
}

/// Clear user session data on logout.
class ClearUserSession extends UserSessionEvent {
  const ClearUserSession();
}
