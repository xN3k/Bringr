import 'package:bringr/core/error/exception.dart';
import 'package:bringr/core/error/failure.dart';
import 'package:bringr/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:bringr/feature/auth/domain/entities/user.dart';
import 'package:bringr/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
