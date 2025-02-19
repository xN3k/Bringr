import 'package:bringr/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:bringr/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:bringr/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:bringr/feature/auth/domain/repository/auth_repository.dart';
import 'package:bringr/feature/auth/domain/usecases/user_sign_in.dart';
import 'package:bringr/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:bringr/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bringr/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator.registerLazySingleton(() => firebase);

  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  // datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator(), serviceLocator()),
    )
    // repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // usecase
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserSignIn(serviceLocator()))
    // bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
