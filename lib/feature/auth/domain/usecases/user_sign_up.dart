import 'package:bringr/core/error/failure.dart';
import 'package:bringr/core/usecase/usecase.dart';
import 'package:bringr/core/common/entities/user.dart';
import 'package:bringr/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<MyUser, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, MyUser>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
