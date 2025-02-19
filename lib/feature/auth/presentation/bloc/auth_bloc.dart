import 'package:bringr/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:bringr/core/common/entities/user.dart';
import 'package:bringr/feature/auth/domain/usecases/user_sign_in.dart';
import 'package:bringr/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final response = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthState(r, emit),
    );
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final response = await _userSignIn(
      UserSignInParams(email: event.email, password: event.password),
    );

    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthState(r, emit),
      // (r) => emit(AuthSuccess(r)),
    );
  }

  void _emitAuthState(MyUser user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
