import 'package:bringr/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:bringr/core/router/router.dart';
import 'package:bringr/core/theme/theme.dart';
import 'package:bringr/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bringr/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bringr',
      theme: AppTheme.lightThemeMode,
      routerConfig: router,
      // home: BlocSelector<AppUserCubit, AppUserState, bool>(
      //   selector: (state) {
      //     return state is AppUserLoggedIn;
      //   },
      //   builder: (context, isLoggedIn) {
      //     if (isLoggedIn) {
      //       return HomeScreen();
      //     }
      //     return SignInScreen();
      //   },
      // ),
    );
  }
}
