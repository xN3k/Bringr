import 'package:bringr/core/error/failure.dart';
import 'package:bringr/feature/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, MyUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, MyUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
