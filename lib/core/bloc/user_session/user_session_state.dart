import 'package:equatable/equatable.dart';

class UserSessionState extends Equatable {
  final bool isAuthenticated;
  final String name;
  final String email;
  final String? avatarUrl;

  const UserSessionState({
    this.isAuthenticated = false,
    this.name = '',
    this.email = '',
    this.avatarUrl,
  });

  UserSessionState copyWith({
    bool? isAuthenticated,
    String? name,
    String? email,
    String? avatarUrl,
  }) {
    return UserSessionState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  List<Object?> get props => [isAuthenticated, name, email, avatarUrl];
}
