import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_session_event.dart';
import 'user_session_state.dart';

/// Global Bloc that holds the current user's session data.
///
/// This does NOT manage login/logout flow itself (that remains
/// in MainNavigationPage for now). It simply stores profile info
/// that other widgets can read.
///
/// Usage from any widget:
/// ```dart
/// final session = context.read<UserSessionBloc>().state;
/// Text(session.name);
/// ```
class UserSessionBloc extends Bloc<UserSessionEvent, UserSessionState> {
  UserSessionBloc() : super(const UserSessionState()) {
    on<SetUserSession>(_onSetUserSession);
    on<ClearUserSession>(_onClearUserSession);
  }

  void _onSetUserSession(
    SetUserSession event,
    Emitter<UserSessionState> emit,
  ) {
    emit(state.copyWith(
      isAuthenticated: true,
      name: event.name,
      email: event.email,
      avatarUrl: event.avatarUrl,
    ));
  }

  void _onClearUserSession(
    ClearUserSession event,
    Emitter<UserSessionState> emit,
  ) {
    emit(const UserSessionState());
  }
}
