import 'package:bringr/core/error/exception.dart';
import 'package:bringr/feature/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);
  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        id: response.user!.uid,
        email: email,
        name: response.user!.displayName ?? '',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential response = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (response.user == null) {
        throw ServerException("User is null");
      }

      await firestore.collection('users').doc(response.user!.uid).set({
        'id': response.user!.uid,
        'name': name,
        'email': email,
      });

      return UserModel(id: response.user!.uid, email: email, name: name);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
