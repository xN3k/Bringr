import 'package:bringr/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:bringr/feature/auth/presentation/screens/sign_in_screen.dart';
import 'package:bringr/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:bringr/feature/products/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder:
          (context, state) => BlocSelector<AppUserCubit, AppUserState, bool>(
            selector: (state) => state is AppUserLoggedIn,
            builder: (context, isLoggedIn) {
              return isLoggedIn ? const HomeScreen() : const SignInScreen();
            },
          ),
    ),

    GoRoute(
      name: "sign_up",
      path: "/sign_up",
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: "sign_in",
      path: "/sign_in",
      builder: (context, state) => SignInScreen(),
    ),
  ],
);
